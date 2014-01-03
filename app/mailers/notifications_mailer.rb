class NotificationsMailer < ActionMailer::Base
  default from: "noreply@cayugaswatchers.org"
  default to: "vp-scheduling@cayugaswatchers.org"

  def new_message(message)
    @message = message
    mail(subject: "Contact Form: #{message.subject}")
  end
end
