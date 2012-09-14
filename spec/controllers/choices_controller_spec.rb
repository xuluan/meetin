require 'spec_helper'

describe ChoicesController do

  let(:user) { FactoryGirl.create(:user, email: 'example@example.com') }
  let(:meeting) { FactoryGirl.create(:meeting) }
  let(:member) { Member.create(user: user, meeting: meeting) }
  let(:role) { Role.create( name: "test", meeting: meeting, assign: member) }

  before (:each) do
    sign_in user
  end

  describe "POST 'create'" do
    it "create when choice no exist" do
      choice = FactoryGirl.build(:choice, member: member, meeting: meeting, role: role, want: true)
      xhr :post, :create, choice: choice.attributes
      response.should be_success
      meeting.reload
      meeting.should have(1).choices
      choice = meeting.choices.first
      
      assigns(:member).should eq(member)
      assigns(:role).should eq(role)
      assigns(:choice).should eq(choice)

    end

    it "create when choice exist" do
      choice = Choice.create(member: member, meeting: meeting, role: role, want: true)
      choice.want = false
      xhr :post, :create, choice: choice.attributes
      response.should be_success
      meeting.reload
      choice.reload
      
      choice.want.should be_false
      meeting.should have(1).choices

      assigns(:member).should eq(member)
      assigns(:role).should eq(role)
      assigns(:choice).should eq(choice)
    end

    it "invalid access"

  end

end
