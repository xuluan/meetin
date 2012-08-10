module MeetingsHelper
class EditPresenter
  extend ActiveSupport::Memoizable

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
      Choice.get_entry(@meeting.id, user_id, role_id).presence || 'OPEN'
  end

  def assign_role(user_id, role_id, cmd = 'Assign')
    role = Role.find(role_id)
    if role
      role.assign_id = user_id 
      role.cmd = cmd
    end
    role
  end

  memoize :choice_status
end

class RoleValidator < ActiveModel::Validator
  def validate(record)
    unless record.role_list.strip.length > 0
      record.errors[:role_list] << 'Role List cannot be empty'
    end
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
