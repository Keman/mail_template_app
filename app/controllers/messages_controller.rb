class MessagesController < ApplicationController
  before_action :find_message, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Message created"
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @message.update(message_params)
      flash[:notice] = "Message updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    flash[:notice] = "Message deleted"
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:title, :text)
  end

  def find_message
    @message = Message.find(params[:id])
  end
end
