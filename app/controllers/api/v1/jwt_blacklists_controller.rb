# frozen_string_literal: true

module Api
  module V1
    class JwtBlacklistsController < Api::V1::ApiController
      def create
        jwt_blacklist = JwtBlacklist.new(token: authorization_token)

        if jwt_blacklist.save
          render json: { message: '0' }, status: :ok
        else
          render json: { message: '-1' }, status: :unprocessable_entity
        end
      end
    end
  end
end
