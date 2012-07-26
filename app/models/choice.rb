class Choice < ActiveRecord::Base
  validates :meeting_id, :presence => true
  validates :user_id, :presence => true
  validates :role_id, :presence => true

  belongs_to :meeting
  belongs_to :user 
  belongs_to :role 

end
