class Role < ActiveRecord::Base
  validates :name, :presence => true
  validates :meeting_id, :presence => true  

  belongs_to :assign, :class_name => "User"
  belongs_to :meeting

  has_many :choices, :dependent => :destroy

end
