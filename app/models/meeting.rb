class Meeting < ActiveRecord::Base

  validates_presence_of :organizer_id, :title, :intro, :location, :started_at
  validates :invitation_list, format: {
    with: /\A\s*((([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\s*)?[;,]\s*)*((([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\s*)?)\z/i,
    message: "Only email allowed" }

  belongs_to :organizer, class_name: "User"
  delegate :username, to: :organizer, prefix: :organizer

  has_many :roles, dependent: :destroy
  accepts_nested_attributes_for :roles, allow_destroy: true

  has_many :members, dependent: :destroy
  accepts_nested_attributes_for :members, allow_destroy: true

  has_many :users, through: :members
  has_many :choices, dependent: :destroy

  self.per_page = 10

  default_scope order('started_at desc')

  after_create :meeting_created

protected

  def meeting_created

    invatations = []
    # add members
    invitationlist = self.invitation_list ? self.invitation_list.split(/[,;]/) : []

    invitationlist.each do |member_email|
      member_email.strip!
      if member_email.length >0
        if user = User.find_by_email(member_email)
          add_member(user)
        else
          UserMailer.meeting_invite(member_email, self).deliver
          invatations << member_email
        end
      end #if
    end #each

    self.invitation_list = invatations.join("; ")
    self.save

    #add organizer
    add_member(self.organizer)
    # send email for each member
    self.members.each do |member|
      UserMailer.meeting_invite(member.email, self).deliver
    end

  end #def

  def add_member(user)
    if user and (not Member.attend?(self.id, user.id))
      member = Member.new
      member.meeting_id = id
      member.user_id = user.id
      member.save
    end #if
  end


end
