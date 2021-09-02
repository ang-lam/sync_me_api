class MessagesController < ApplicationController
  skip_before_action :require_login, only: [:index, :create, :delete]

  # GET /messages
  def index
    messages = Message.all

    render json: messages, include: [:sender, :recipient]
  end

  # POST /messages
  def create
    message = Message.new(message_params)

    if message.save
      render json: message, include: [:sender, :recipient]
    else
      render json: message.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:sender_id, :recipient_id, :content)
    end
end
