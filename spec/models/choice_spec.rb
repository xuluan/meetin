require 'spec_helper'

describe Choice do
  
  it "is a valid choice" do
    choice = FactoryGirl.build(:choice)
    choice.should be_valid
  end    

  it { should  validate_presence_of(:member_id)}

  it { should  validate_presence_of(:meeting_id)}

  it { should  validate_presence_of(:role_id)}

  it { should  belong_to(:meeting)}

  it { should  belong_to(:member)}

  it { should  belong_to(:role)}

end


