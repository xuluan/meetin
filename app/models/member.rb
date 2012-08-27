class Member < ActiveRecord::Base
  validates :meeting_id, :presence => true
  validates :user_id, :presence => true

  belongs_to :meeting
  belongs_to :user

  after_save :sync_to_choice_role


  def Member.join?(m, u)
    self.where("meeting_id = ? and user_id = ? and status = ?",m, u, true).first
  end

  def sync_to_choice_role
    return if status

    Choice.where("meeting_id = ? and user_id = ?", meeting_id, user_id).each do |choice|
      choice.delete
    end

    role = Role.where("meeting_id = ? and assign_id = ?", meeting_id, user_id).first
    
    if role
      role.assign_id = nil
      role.save
    end

  end

  def to_s
  	user.username
  end  
end
