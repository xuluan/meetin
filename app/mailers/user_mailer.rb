class UserMailer < ActionMailer::Base
  default from: "no-reply@tmeetin.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.meeting_invite.subject
  #
  def meeting_invite(email, meeting)
    @meeting = meeting

    mail from: meeting.organizer.email, to: email, subject: "Meeting invitation: #{meeting.title}"do |format|
      format.html
    end
  end
end

