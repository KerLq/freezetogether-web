# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::API
      before_action :authorization_token
      before_action :authorize_request

      def jwt_blacklists(header)
        render json: { error: 'unauthorized' }, status: :unauthorized if JwtBlacklist.find_by(token: header)
      end

      def not_found
        render json: { error: 'not_found' }
      end

      def authorization_token
        request.headers['Authorization']&.split(' ')&.last
      end

      def authorize_request
        jwt_blacklists(authorization_token)
        begin
          @decoded = JsonWebToken.decode(authorization_token)
          @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound || JWT::VerificationError, JWT::DecodeError => e
          render json: { errors: e.message }, status: :unauthorized
        end
      end
    end
  end
end
