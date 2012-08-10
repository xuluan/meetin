class Choice < ActiveRecord::Base
  validates :meeting_id, :presence => true
  validates :user_id, :presence => true
  validates :role_id, :presence => true

  belongs_to :meeting
  belongs_to :user 
  belongs_to :role 

  def Choice::get_entry(m, u,r)
    self.where("meeting_id = ? and user_id = ? and role_id = ?",m, u, r).first
  end


  def to_s
    if want.nil?
      'NONE'
    else
      want ? 'WANT' : 'DONTWANT'
    end
  end

end
