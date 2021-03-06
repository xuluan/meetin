module MeetingsHelper

  def is_new_meeting(meeting)
    Time.now > meeting.started_at ? "old_meeting" : "new_meeting"
  end

  def assign_status_class(role)
    choice = Choice.find_choice(role.meeting_id, role.assign_id, role.id)
    return "nochoice" unless choice # no assign or no choice
    return "nochoice" if choice.want == nil # choice.want == nil 

    if choice.want
      return "choicewant"
    else
      return "choicenot4me"
    end
  end

  def current_user_class(user)
    user == current_user ? "currentuser" : "nocurrentuser"
  end

  def assign_status_for(role, member_id)
    if role.assign_id == member_id
     klass ="color_" + Choice.find_choice(role.meeting_id, member_id, role.id).to_s
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

  # for active class, but didn't use
  def active_class(actionName)
    if params[:type] == actionName
      "active"
    end
  end

  def display_invitaion_list(meeting)
    invitation_list =  meeting.invitation_list.blank? ? " EMPTY" : meeting.invitation_list
    raw label_tag "Invitation List", invitation_list
  end

  class EditPresenter
    attr_reader :meeting, :member

    def initialize(meeting, user)
      @meeting = meeting
      @member = Member.attend?(meeting.id, user.id)
    end


    def make_choice(member_id, role_id, want)
      choice = Choice.new
      choice.meeting_id = @meeting.id
      choice.member_id = member_id
      choice.role_id = role_id
      choice.want = want

      choice

    end

    def choice_status(member_id, role_id)
        Choice.find_choice(@meeting.id, member_id, role_id).presence || "\t"
    end

    def assign_role(member_id, role_id, cmd = 'Assign')
      role = Role.find(role_id)
      if role
        role.assign_id = member_id
        role.cmd = cmd
      end
      role
    end

  end

end
