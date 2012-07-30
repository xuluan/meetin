module MeetingsHelper

  def meeting_create(meeting)
    # add roles
    role_list = meeting.role_list.split(';')
    role_list.each do |role_name|
      role_name.strip!
      if role_name.length > 0
        role =Role.new
        role.name = role_name
        role.meeting_id = meeting.id
        role.save
      end
    

    # add members
    member_list.each do |member_email|
      member_email.strip!
      if member_email.length >0
        user = User.find_by_email(member_email).first
        if user
          member = Member.new
          member.meeting_id = meeting.id 
          member.user_id = user.id 
          member.save
      end   
    end    



    # send emails
  end	
end
