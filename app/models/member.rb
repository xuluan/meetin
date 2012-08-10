class Member < ActiveRecord::Base
  validates :meeting_id, :presence => true
  validates :user_id, :presence => true

  belongs_to :meeting
  belongs_to :user

  before_destroy :sync_to_choice_role

  def sync_to_choice_role
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
