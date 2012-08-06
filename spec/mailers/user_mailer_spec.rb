require "spec_helper"

describe UserMailer do
  describe "meeting_invite" do
    let(:mail) { UserMailer.meeting_invite }

    it "renders the headers" do
      mail.subject.should eq("Meeting invite")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["no-reply@meetin.xunuo.mem"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
