class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]
  skip_before_action :require_login, only: [:index, :create, :delete]

  # GET /messages
  def index
    messages = Message.all

    render json: messages, include: [:sender, :recipient]
  end

  # GET /messages/1
  def show
    render json: @message
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

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:sender_id, :recipient_id, :content)
    end
end
