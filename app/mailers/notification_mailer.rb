class NotificationMailer < ApplicationMailer
    def new_email
        @employee = params[:employee]
        mail(to: @employee.email, subject: "You got a new message!",body: "something")
      end
end
