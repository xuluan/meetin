require 'spec_helper'

describe Meeting do

  context "when validate" do

    it "is a valid meeting" do
      meeting = FactoryGirl.build(:meeting)
      meeting.should be_valid
    end

    it "is a valid meeting" do
      FactoryGirl.build(:meeting2).should be_valid
    end


    # pending for MemberValidator

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:manager_id) }
    it { should validate_presence_of(:intro) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:started_at) }

    it { should have_many(:roles) }
    it { should have_many(:choices) }
    it { should have_many(:users).through(:members) }
    it { should belong_to(:manager) }


    it "is invalid with an error email in member list" do
      err_email_memberlist = FactoryGirl.build(:err_email_memberlist)
      err_email_memberlist.should_not be_valid
      err_email_memberlist.should have(1).errors_on(:invitation_list)
    end


    it "is valid with empty email in member list" do
      empty_memberlist = FactoryGirl.build(:empty_memberlist)
      empty_memberlist.should be_valid
    end

  end

  context "when created with invitation_list" do

    before (:each) do
      user = FactoryGirl.create(:user, email: 'example@example.com') 
    end

    it "add member if user exist and remove it from invitation_list" do
      meeting = FactoryGirl.create(:meeting2)
      meeting.reload
      meeting.should have(2).members
      meeting.invitation_list.should == "aa@bb.com" 
    end

    it "send mail to members, manager and invitation_list" do
      deliver = stub(:deliver)
      UserMailer.should_receive(:meeting_invite).with("aa@bb.com", anything).once.and_return(deliver)
      UserMailer.should_receive(:meeting_invite).with("example@example.com", anything).once.and_return(deliver)      
      UserMailer.should_receive(:meeting_invite).with(/username(\d*)@example.com/, anything).once.and_return(deliver)      
      deliver.should_receive(:deliver).exactly(3).times      
      meeting = FactoryGirl.create(:meeting2)
    end

  end

  context "when after created" do

    it "can add a role" do
      meeting = FactoryGirl.create(:meeting)
      role = Role.create(name:'role', meeting_id: meeting.id)
      meeting.should have(1).roles
      meeting.invitation_list.should == "aa@bb.com"
    end

    it "can add two roles" do
      meeting = FactoryGirl.create(:meeting)
      role1 = Role.create(name:'role1', meeting_id: meeting.id)
      role2 = Role.create(name:'role2', meeting_id: meeting.id)      
      meeting.should have(2).roles
      meeting.invitation_list.should == "aa@bb.com"
    end

    it "can add a member" do
      user = FactoryGirl.create(:user, email: 'example@example.com')
      meeting = FactoryGirl.create(:meeting)
      member = Member.create(user:user, meeting:meeting)
      meeting.reload
      meeting.should have(2).members
    end


  end


  context "when it has already been created (edit)" do
    
  end

end
