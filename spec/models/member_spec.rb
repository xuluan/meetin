require 'spec_helper'

describe Member do
  it "is a valid member" do
    member = FactoryGirl.build(:member)
    member.should be_valid
  end    

  it "is an invalid member without user_id" do
    member = FactoryGirl.build(:member_no_user_id)
    member.should_not be_valid
    member.should have(1).errors_on(:user_id)
  end   

  xit "is an invalid member without meeting_id" do
    member = FactoryGirl.build(:member_no_meeting_id)
    member.should_not be_valid
    member.should have(1).errors_on(:meeting_id)
  end  

  it "is an invalid member with_status_false" do
    member = FactoryGirl.build(:member_status_false)
    member.should be_valid
  end    
end
