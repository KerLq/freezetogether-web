# frozen_string_literal: true

module Backend
  class AchievementsController < Backend::BackendController
    def index
      controller_authorize(Achievement)

      @achievements = Achievement.all.order('id DESC')
    end

    def show
      controller_authorize(achievement)
    end

    def new
      controller_authorize(Achievement)

      @achievement = Achievement.new
    end

    def edit
      controller_authorize(achievement)
    end

    def create
      controller_authorize(Achievement)

      achievement = Achievement.new(permitted_attributes(Achievement))
      achievement.cover_image.attach(params[:achievement][:cover_image])

      if achievement.save
        redirect_to backend_achievements_path, flash: { success: t('.success') }
      else
        redirect_to new_backend_achievement_path, flash: { error: t('.failed') }
      end
    end

    def update
      controller_authorize(achievement)

      achievement.cover_image.attach(params[:achievement][:cover_image]) if params[:achievement][:cover_image]

      if achievement.update(permitted_attributes(achievement))
        redirect_to edit_backend_achievement_path(achievement), flash: { success: t('.success') }
      else
        redirect_to edit_backend_achievement_path(achievement), flash: { error: t('.failed') }
      end
    end

    def destroy
      controller_authorize(achievement)
      if achievement.destroy
        redirect_to backend_achievements_path, flash: { success: t('.success') }
      else
        redirect_to backend_achievements_path, flash: { error: t('.failed') }
      end
    end

    private

    def achievement
      @achievement ||= Achievement.find_by(id: params[:id])
    end
  end
end
