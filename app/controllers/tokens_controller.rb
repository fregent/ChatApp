class TokensController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def create
    # Assuming username is passed in the request
    username = params[:username]

    # Find or create the user based on the username
    @user = User.find_or_create_by(username: username)

    # Generate a new token for the user
    @user.regenerate_auth_token

    render json: { token: @user.auth_token }
  end
end
