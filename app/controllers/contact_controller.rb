class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      flash[:succes] = "Message sent successfully!"
      redirect_to '/contact'
    else
      flash.now[:error] = "Message not sent"
      redirect_to '/contact'
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :subject, :body)
    end
end
