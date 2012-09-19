class Member < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates_presence_of :user_id

  belongs_to :meeting
  belongs_to :user
  has_many :choices

  delegate :username, to: :user
  delegate :email, to: :user

  after_save :cleanup_when_exit
  before_destroy :cleanup

  scope :attendence, lambda { |status = true| where("status = ? ", status) }

  def Member.attend?(meeting_id, user_id, status = true)
    Member.where("meeting_id = ? and user_id = ? and status = ? ", meeting_id, user_id, status).first
  end

  def Member::signin(params)
    member = where("meeting_id = ? and user_id = ?", params[:meeting_id], params[:user_id]).first
    if member
      member.status = true
      member.save
    else
      member = create(meeting_id: params[:meeting_id].to_i, user_id: params[:user_id].to_i, status: true)
    end

    member
  end

  def Member::signoff(id)
    member = Member.find(id)

    if member
      member.status = false
      member.tap {|m| m.save}
    end
  end


  def to_s
    user.username
  end


  protected

  def cleanup_when_exit
    cleanup unless self.status
  end

  def cleanup
    self.choices.each { |c| c.delete }

    Role.where("meeting_id = ? and assign_id = ?", meeting_id, self.id).each do |r|
      r.assign_id = nil
      r.save
    end
  end
end
