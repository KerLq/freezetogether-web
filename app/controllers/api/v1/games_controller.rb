# frozen_string_literal: true

module Api
  module V1
    class GamesController < Api::V1::ApiController
      def create
        debugger

        @game = @user.games.new(game_params)

        if @game.save
          render json: { message: '0' }, status: :ok
        else
          render json: { message: '-1' }, status: :unprocessable_entity
        end
      end

      def upload
        user = User.find_by(token: authorization_token)
        
        return unless user

        json_decoded = JSON.parse(params[:game])
        
        achievements = json_decoded["game"]["achievements"].collect {|achievement| Achievement.find_by(title: achievement["title"])}
        coins = json_decoded["game"]["coin"]
        score = json_decoded["game"]["score"]

        game = user.games.new(score:, coin: coins) # Rename coin column to 'coins'

        unless game.save
          # return error message
        end

        achievements.each do |achievement|
          user_achievement = game.accomplished_achievements.new(achievement:)

          next unless user_achievement.save

          # return error message
        end

      end
    end
  end
end
