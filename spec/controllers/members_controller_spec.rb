require 'spec_helper'

describe MembersController do

  let(:user) { FactoryGirl.create(:user, email: 'example@example.com') }
  let(:meeting) { FactoryGirl.create(:meeting) }

  before (:each) do
    sign_in user
  end

  describe "POST 'create'" do
    it "join when member no exist" do
      get 'create', user_id: user.id, meeting_id: meeting.id
      response.should redirect_to(meeting)

      meeting.reload
      meeting.should have(2).members
      member = meeting.members.where("user_id = ?", user.id).first
      assigns(:member).should eq(member)
    end

    it "join when member exist" do
      member = Member.create(user: user, meeting: meeting, status: false)

      get 'create', user_id: user.id, meeting_id: meeting.id
      response.should redirect_to(meeting)

      member.reload
      member.status.should be_true

      assigns(:member).should eq(member)

    end    

    it "invalid access"

  end

  describe "GET 'destroy'" do
  
    let(:member) { Member.create(user: user, meeting: meeting) }

    it "exit" do
      member.reload
      member.status.should be_true

      get 'destroy', id: member.id
      response.should redirect_to(meeting)

      member.reload
      member.status.should be_false
    end

    it "invalid access"    
  end

end
