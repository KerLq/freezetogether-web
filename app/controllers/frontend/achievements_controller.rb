# frozen_string_literal: true

module Frontend
  class AchievementsController < Frontend::FrontendController
    def index
      authorize(Achievement)
      @achievements = Achievement.all
    end

    def show
      authorize(achievement)
    end

    private

    def achievement
      @achievement ||= Achievement.find_by(id: params[:id])
    end
  end
end
