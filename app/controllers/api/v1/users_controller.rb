# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::V1::ApiController
      def me
        render json: @current_user, status: :ok
      end

      private

      def user_params
        params.require(:user).permit(
          :username,
          :email,
          :password
        )
      end
    end
  end
end
