require 'spec_helper'

describe Choice do
  it "is a valid choice" do
    choice = FactoryGirl.build(:choice)
    choice.should be_valid
  end    

  it "is an invalid choice without user_id" do
    choice = FactoryGirl.build(:choice_no_user_id)
    choice.should_not be_valid
    choice.should have(1).errors_on(:user_id)
  end    

  it "is an invalid choice without role_id" do
    choice = FactoryGirl.build(:choice_no_role_id)
    choice.should_not be_valid
    choice.should have(1).errors_on(:role_id)
  end    

  it "is an invalid choice without meeting_id" do
    choice = FactoryGirl.build(:choice_no_meeting_id)
    choice.should_not be_valid
    choice.should have(1).errors_on(:meeting_id)
  end    

end


