# frozen_string_literal: true

module Api
  module V1
    class GamesController < Api::V1::ApiController
      before_action :set_user

      def set_user
        @user = User.find_by(token: params[:token])
      end

      def index
        @games = @user.games.all
        render json: @games, status: :ok
      end

      def create
        @game = @user.games.new(game_params)

        if @game.save
          render json: { message: '0' }, status: :ok
        else
          render json: { message: '-1' }, status: :unprocessable_entity
        end
      end

      def game_params
        params.permit(
          :score,
          :coin,
          :time
        )
      end
    end
  end
end
