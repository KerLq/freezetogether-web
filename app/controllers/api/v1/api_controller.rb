class Api::V1::ApiController < ActionController::API
  before_action :authorize_request

  def jwt_blacklists(header)
    render json: { error: 'unauthorized' }, status: :unauthorized if JwtBlacklist.find_by(token: header)
  end

  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    jwt_blacklists(header)
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound || JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
  
end