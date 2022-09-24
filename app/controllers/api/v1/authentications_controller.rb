# frozen_string_literal: true

module Api
  module V1
    class AuthenticationsController < Api::V1::ApiController
      before_action :authorize_request, except: :login

      # POST /auth/login
      def login
        @user = User.find_by(username: params[:username])
        if @user&.authenticate(params[:password])
          token = JsonWebToken.encode(user_id: @user.id)
          time  = Time.zone.now + 24.hours.to_i
          JwtBlacklist.blacklist(@user.token) if @user.token

          @user.update(token:)
          render json: { token: @user.token, exp: time.strftime('%m-%d-%Y %H:%M'),
                         username: @user.username }, status: :ok
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end

      def validate_token
        if (@user = User.find_by(token: authorization_token))
          render json: { token: @user.token }, status: :ok
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end

      private

      def login_params
        params.permit(:username, :email, :password)
      end
    end
  end
end
