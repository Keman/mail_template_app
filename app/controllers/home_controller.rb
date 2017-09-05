class HomeController < ApplicationController
  def index
    @messages = Message.all
    @accounts = Account.all
  end

  def deliver_mail
    account = Account.find(params[:account])
    message = Message.find(params[:message])

    # AccountMailer.notify(message, account).deliver_now

    flash[:notice] = "Message with title #{message.title} was successfully sended to #{account.email}"
    redirect_to root_path
  end
end
