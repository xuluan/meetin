class Member < ActiveRecord::Base
  validates :meeting_id, :presence => true
  validates :user_id, :presence => true

  belongs_to :meeting
  belongs_to :user
end
