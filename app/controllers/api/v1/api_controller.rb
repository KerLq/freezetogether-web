# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::API
      before_action :authorization_token
      before_action :authorize_request

      def jwt_blacklists(header)
        JwtBlacklist.find_by(token: header)
      end

      def not_found
        render json: { message: '-1' }
      end

      def authorization_token
        request.headers['Authorization']&.split(' ')&.last
      end

      def authorize_request
        return false if jwt_blacklists(authorization_token)

        begin
          @decoded     = JsonWebToken.decode(authorization_token)
          Current.user = User.find_by(id: @decoded[:user_id])
        rescue ActiveRecord::RecordNotFound || JWT::VerificationError, JWT::DecodeError => e
          render json: { message: '-1' }, status: :unauthorized
        end
      end
    end
  end
end
