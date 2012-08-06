require 'spec_helper'

describe Meeting do

  it "is a valid meeting" do
  	meeting = FactoryGirl.build(:meeting)
    meeting.should be_valid
    meeting = FactoryGirl.create(:meeting)
    meeting.should have(1).roles
  end

  it "is a valid meeting" do
  	FactoryGirl.build(:meeting2).should be_valid
  end

  it "is invalid with an empty role list" do
    empty_rolelist = FactoryGirl.build(:empty_rolelist)
    empty_rolelist.should_not be_valid
    empty_rolelist.should have(1).errors_on(:role_list)
    empty_rolelist.should have(2).errors_on(:member_list)

  end


  it "is invalid with an error email in member list" do
    err_email_memberlist = FactoryGirl.build(:err_email_memberlist)
    err_email_memberlist.should_not be_valid
    err_email_memberlist.should have(2).errors_on(:member_list)
  end


  it "is invalid with empty email in member list" do
  	empty_memberlist = FactoryGirl.build(:empty_memberlist)
    empty_memberlist.should_not be_valid
    empty_memberlist.should have(1).errors_on(:member_list)
  end

end
