class NotificationMailer < ApplicationMailer
    def new_email(message)
        @message = message
        mail(to: @message[:email], subject: message[:subject], body: message[:content])
      end
end
