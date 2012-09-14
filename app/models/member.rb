class Member < ActiveRecord::Base
  validates :user_id, :presence => true

  belongs_to :meeting
  belongs_to :user
  has_many :choices

  delegate :username, to: :user

  after_save :cleanup_when_exit
  before_destroy :cleanup

  scope :attendence, lambda { |status = true| where("status = ? ", status) }

  def self.attend?(meeting_id, user_id, status = true)
    Member.where("meeting_id = ? and user_id = ? and status = ? ", meeting_id, user_id, status).first
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
