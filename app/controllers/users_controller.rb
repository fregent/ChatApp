class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_request, except: [:index, :show]

  # GET /users
  # List all users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/:id
  # Show a specific user
  def show
    render json: @user
  end

  private

  # Set the user from the URL :id
  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end
end
