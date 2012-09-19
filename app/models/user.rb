class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :mymeetings, class_name: "Meeting", foreign_key: "organizer_id"

  has_many :members
  has_many :meetings, through: :members

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  def to_s
    username
  end

  def operate?(meeting)
    (meeting.organizer_id == id) || Member.attend?(meeting.id, self.id)
  end

  def member?(member)
    member.user_id == id
  end

end
