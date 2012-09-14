require 'spec_helper'

describe Member do

  context "when validate" do

    it "is a valid member" do
      member = FactoryGirl.build(:member)
      member.should be_valid
    end    

    it { should  validate_presence_of(:user_id)}

    xit { should  validate_presence_of(:meeting_id)}

    it { should  belong_to(:meeting)}

    it { should  belong_to(:user)}

    it { should  have_many(:choices)}

    it "is a valid member with_status_false" do
      member = FactoryGirl.build(:member_status_false)
      member.should be_valid
    end    

  end

  context "after created" do  
    let(:user) { FactoryGirl.create(:user, email: 'example@example.com') }
    let(:meeting) { FactoryGirl.create(:meeting) }
    let(:member) { Member.create(user: user, meeting: meeting) }
    let(:role) { Role.create( name: "test", meeting: meeting, assign: user) }

    before (:each) do
      choice = Choice.create(member: member, meeting: meeting, role: role, want: true)
    end

    it "should be cleanup when exit" do
      member.reload
      member.status = false      
      member.save
      role.reload
      member.reload
      meeting.reload

      meeting.should have(2).members
      meeting.should have(0).choices
      role.assign.should be_nil
    end

    it "should be cleanup when deleted" do
      meeting.reload
      member.reload
      member.destroy
      role.reload
      meeting.reload


      meeting.should have(1).members
      meeting.should have(0).choices
      
      #role.assign.should be_nil
    end

  end
end
