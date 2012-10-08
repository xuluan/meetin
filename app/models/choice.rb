class Choice < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates_presence_of :meeting_id, :member_id, :role_id

  belongs_to :meeting
  belongs_to :member
  belongs_to :role


  def Choice::find_choice(meeting_id, member_id, role_id)
    self.where("meeting_id = ? and member_id = ? and role_id = ?",
      meeting_id, member_id, role_id).first
  end


  def Choice::make_choice(params)
    choice = find_choice(params[:meeting_id], params[:member_id], params[:role_id])

    if choice
      choice.assign_attributes(params)
    else
      choice = Choice.new(params)
    end
    choice.tap { |c| c.save }
  end


  def to_s
    if want.nil?
      'CLEAR'
    else
      want ? 'WANT' : 'NOT4ME'
    end
  end

end
