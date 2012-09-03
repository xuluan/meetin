require 'redcarpet/compat'

class Meeting < ActiveRecord::Base
  include ActiveModel::Validations
  after_create :meeting_created

  validates_with MeetingsHelper::MemberValidator  

  validates :manager_id, :presence => true
  validates :title, :presence => true
  validates :agenda, :presence => true
  validates :location, :presence => true
  validates :started_at, :presence => true

  belongs_to :manager, :class_name => "User"

  has_many :roles, :dependent => :destroy
  accepts_nested_attributes_for :roles, allow_destroy: true
  
  has_many :members, :dependent => :destroy
  accepts_nested_attributes_for :members, allow_destroy: true

  has_many :users, :through => :members    
  has_many :choices, :dependent => :destroy

  self.per_page = 10

  default_scope order('started_at desc') 

  def agenda_html
    Markdown.new(agenda, :hard_wrap).to_html
  end

  protected

  def meeting_created

    
    # send email for each member
    self.members.each do |member|
      UserMailer.meeting_invite(member.user.email, self).deliver
    end

    invatations = []
    # add members
    memberlist = self.member_list.split(/[,;]/)

    memberlist.each do |member_email|
      member_email.strip!
      if member_email.length >0
        add_member(User.find_by_email(member_email))
      else
        UserMailer.meeting_invite(member_email, self).deliver
        invatations << member_email
      end #if
    end #each    

    self.member_list = invatations.join("; ")
    self.save

    #add manager 
    add_member(self.manager)
  end #def

  def add_member(user)
    if user and (not Members.join?(self.id, user.id))
      member = Member.new
      member.meeting_id = id 
      member.user_id = user.id 
      member.save
    end #if

    # send emails
    UserMailer.meeting_invite(member_email, self).deliver
  end


end
