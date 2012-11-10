require "spec_helper"

describe UserMailer do
  describe "meeting_invite" do
    before(:each) do
      @meeting = FactoryGirl.create(:meeting2)
      @to_mail = 'example@example.com'      
      @mail = UserMailer.meeting_invite(@to_mail, @meeting)

    end
    #let(:mail) { UserMailer.meeting_invite('example@example.com') }

    it "renders the headers" do
      @mail.subject.should eq("Meeting invitation: #{@meeting.title}")
      @mail.to.should eq([@to_mail])
      @mail.from.should eq(["no-reply@tmeetin.com"])
    end

    it "renders the body" do
      @mail.body.encoded.should match("Welcome to join our meeting:")
    end
  end

end
