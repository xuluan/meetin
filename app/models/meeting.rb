require 'redcarpet/compat'

class Meeting < ActiveRecord::Base
  include ActiveModel::Validations
  after_create :meeting_created

  validates_with MeetingsHelper::RoleValidator  
  validates_with MeetingsHelper::MemberValidator  

  validates :manager_id, :presence => true
  validates :title, :presence => true
  validates :agenda, :presence => true
  validates :location, :presence => true
  validates :started_at, :presence => true

  belongs_to :manager, :class_name => "User"

  has_many :roles, :dependent => :destroy
  has_many :members, :dependent => :destroy
  has_many :choices, :dependent => :destroy

  def agenda_html
    Markdown.new(agenda, :hard_wrap).to_html
  end

  protected

  def meeting_created
    # add roles
    rolelist = self.role_list.split(';')
    rolelist.each do |role_name|
      role_name.strip!
      if role_name.length > 0
        role =Role.new
        role.name = role_name
        role.meeting_id = id
        role.save
      end #if
    end #each
    
    # add members
    memberlist = self.member_list.split(';')

    memberlist.each do |member_email|
      member_email.strip!
      if member_email.length >0
        users = User.find_by_email(member_email)
        user =  users.first if users
        if user
          member = Member.new
          member.meeting_id = id 
          member.user_id = user.id 
          member.save
        end #if
      end #if
    end #each    

    # send emails
  end #def


end
