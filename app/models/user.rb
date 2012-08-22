class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, :presence => true
  validates :username, :uniqueness => true

  has_many :mymeetings, :class_name => "Meeting", :foreign_key => "manager_id"

  has_many :members
  has_many :meetings, :through => :members  

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  def to_s
  	username
  end

  def manager?(meeting)
    meeting.manager_id == id
  end

  def member?(member)
    member.user_id == id
  end  

  def edit_action(meeting)
    manager?(meeting) ? 'Assign' : 'Choose'
  end
  
end
