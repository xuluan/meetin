module MeetingsHelper

  def is_new_meeting(meeting)
    Time.now > meeting.started_at ? "old_meeting" : "new_meeting"
    
  end


  def assign_status_for(meeting, role, user_id)
    if role.assign_id == user_id
     klass ="color_" + Choice.get_entry(meeting.id, user_id, role.id).to_s
     content_tag(:p, "X", :class => klass.downcase)
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

class EditPresenter

  def initialize(meeting)
    @meeting = meeting
  end


  def make_choice(user_id, role_id, want)
    choice = Choice.new
    choice.meeting_id = @meeting.id 
    choice.user_id = user_id
    choice.role_id = role_id
    choice.want = want

    choice

  end

  def choice_status(user_id, role_id)
      Choice.get_entry(@meeting.id, user_id, role_id).presence || "\t"
  end

  def assign_role(user_id, role_id, cmd = 'Assign')
    role = Role.find(role_id)
    if role
      role.assign_id = user_id 
      role.cmd = cmd
    end
    role
  end

end

class MemberValidator < ActiveModel::Validator
  def validate(record)
    member_list = record.member_list.split(/[,;]/)
    
    i = 0
    member_list.each do |member|
      member.strip!
      next if member.length == 0 #skip when email is empty
      unless member.strip =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        record.errors[:member_list] << ("All members in Member List must be valid email address.")
        break
      end   
      i += 1
    end
    record.errors[:member_list] << 'Member List cannot be empty' if i == 0
  end
end


end
