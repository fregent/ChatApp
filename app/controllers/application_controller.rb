class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    token = request.headers['Authorization'].to_s.split(' ').last
    @current_user = User.find_by(auth_token: token)
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
