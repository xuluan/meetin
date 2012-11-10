require "spec_helper"

describe UserMailer do
  describe "meeting_invite" do
    before(:each) do
      @meeting = FactoryGirl.create(:meeting2)
      @to_mail = 'example@example.com'      
      @mail = UserMailer.meeting_invite(@to_mail, @meeting)
      @from_mail = @meeting.organizer.email

    end
    #let(:mail) { UserMailer.meeting_invite('example@example.com') }

    it "renders the headers" do
      @mail.subject.should eq("Meeting invitation: #{@meeting.title}")
      @mail.to.should eq([@to_mail])
      @mail.from.should eq([@from_mail])
    end

    it "renders the body" do
      @mail.body.encoded.should match("Dear BestAssets Fellow Toastmasters:")
    end
  end

end
