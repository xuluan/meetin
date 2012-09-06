class Member < ActiveRecord::Base
  validates :user_id, :presence => true

  belongs_to :meeting
  belongs_to :user
  #has_many :choices, :through => :users, :dependent => :destroy
  delegate :username, to: :user

  after_save :cleanup
  before_destroy :cleanup

  def Member.join?(m, u)
    self.where("meeting_id = ? and user_id = ? and status = ?",m, u, true).first
  end

  def to_s
  	user.username
  end  

  protected

  def cleanup
    #delete all choice
    Choice.where("meeting_id = ? and user_id = ?", meeting_id, user_id).each { |c| c.delete }

    #clear all assign
    Role.where("meeting_id = ? and assign_id = ?", meeting_id, user_id).each do |r| 
      r.assign_id = nil
      r.save
    end
  end

end
