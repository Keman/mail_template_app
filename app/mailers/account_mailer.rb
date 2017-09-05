class AccountMailer < ApplicationMailer
  def notify(message, account)
    @message = message
    @account = account

    mail(to: @account.email, subject: @message.title)
  end
end
