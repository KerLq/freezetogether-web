# frozen_string_literal: true

module Backend
  class GamesController < Backend::BackendController
    def index
      controller_authorize(Game)

      @games = Game.all.order('id DESC')
    end

    def show
      controller_authorize(game)
    end

    def new
      controller_authorize(Game)

      @game = Game.new
    end

    def edit
      controller_authorize(game)
    end

    def create
      controller_authorize(Game)

      game = Game.new(permitted_attributes(Game))
      game.cover_image.attach(params[:game][:cover_image])

      if game.save
        redirect_to backend_games_path, flash: { success: t('.success') }
      else
        redirect_to new_backend_game_path, flash: { error: t('.failed') }
      end
    end

    def update
      controller_authorize(game)

      game.avatar.attach(params[:game][:cover_image]) if params[:game][:cover_image]

      if game.update(permitted_attributes(game))
        redirect_to edit_backend_game_path(game), flash: { success: t('.success') }
      else
        redirect_to edit_backend_game_path(game), flash: { error: t('.failed') }
      end
    end

    def destroy
      controller_authorize(game)
      if game.destroy
        redirect_to backend_games_path, flash: { success: t('.success') }
      else
        redirect_to backend_games_path, flash: { error: t('.failed') }
      end
    end

    private

    def game
      @game ||= Game.find_by(id: params[:id])
    end
  end
end
