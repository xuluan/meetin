require 'spec_helper'

describe Role do
  it "is a valid role" do
    role = FactoryGirl.build(:role)
    role.should be_valid
  end    

  xit "is an invalid role without meeting_id" do
    role = FactoryGirl.build(:role_no_meeting_id)
    role.should_not be_valid
    role.should have(1).errors_on(:meeting_id)
  end   

  it "is an invalid role without name_id" do
    role = FactoryGirl.build(:role_no_name)
    role.should_not be_valid
    role.should have(1).errors_on(:name)
  end   

  it "is a valid role without assign_id" do
    role = FactoryGirl.build(:role_no_assign_id)
    role.should be_valid
  end     
end
