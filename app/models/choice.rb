class Choice < ActiveRecord::Base
  validates :meeting_id, :presence => true
  validates :member_id, :presence => true
  validates :role_id, :presence => true

  belongs_to :meeting
  belongs_to :member 
  belongs_to :role 

  def Choice::get_entry(meeting_id, member_id, role_id)
    self.where("meeting_id = ? and member_id = ? and role_id = ?", meeting_id, member_id, role_id).first
  end


  def to_s
    if want.nil?
      'NONE'
    else
      want ? 'WANT' : 'DONTWANT'
    end
  end

end
