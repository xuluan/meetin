require 'spec_helper'

describe Meeting do

  it "is invalid with an empty role list" do
  	FactoryGirl.build(:empty_rolelist).should_not be_valid
  end

  it "is invalid with an error email in member list" do
  	FactoryGirl.build(:err_email_memberlist).should_not be_valid
  end


  it "is a valid meeting" do
  	FactoryGirl.build(:meeting).should be_valid
  end

  it "is a valid meeting" do
  	FactoryGirl.build(:meeting2).should be_valid
  end

  it "is invalid with empty email in member list" do
  	FactoryGirl.build(:empty_memberlist).should_not be_valid
  end

end
