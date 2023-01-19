# frozen_string_literal: true

module Api
  module V1
    class GamesController < Api::V1::ApiController
      def upload
        json_decoded = JSON.parse(params[:game])

        achievements = json_decoded['game']['achievements'].collect do |achievement|
          Achievement.find_by(title: achievement['title'], scores: achievement['score'])
        end

        coins        = json_decoded['game']['coins'].to_i
        score        = json_decoded['game']['score'].to_i
        milliseconds = json_decoded['game']['time'].to_f

        time = '00:00:00:00'

        if milliseconds.present?
          seconds = milliseconds / 1000
          time    = Time.at(seconds).utc.strftime('%H:%M:%S:%L')
        end

        game  = Current.user.games.build(score:, coin: coins, time:) # Rename coin column to 'coins'

        achievements.each do |achievement|
          game.accomplished_achievements.build(achievement:)
        end

        return if game.save

        render json: {}, status: :internal_server_error
        nil
      end
    end
  end
end
