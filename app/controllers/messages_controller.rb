class MessagesController < ApplicationController
  before_action :set_message, only: [:show]
  before_action :authenticate_request

  # GET /messages
  # List all messages
  def index
    @messages = Message.all
    render json: @messages
  end

  # GET /messages/:id
  # Show a specific message
  def show
    render json: @message
  end

  # POST /messages
  # Create a new message
  def create
    @message = Message.new(message_params)
    @message.user = @current_user # Assuming @current_user is set by authenticate_request

    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through
  def message_params
    params.require(:message).permit(:content)
  end
end
