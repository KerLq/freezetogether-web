# frozen_string_literal: true

module Backend
  class CharactersController < Backend::BackendController
    def index
      controller_authorize(Character)

      @characters = Character.all
    end

    def show
      controller_authorize(character)
    end

    def new
      controller_authorize(Character)

      @character = Character.new
    end

    def edit
      controller_authorize(character)
    end

    def create
      controller_authorize(Character)

      character = Character.new(controller_permitted_attributes(Character))
      character.image.attach(params[:character][:image])

      if character.save
        redirect_to backend_characters_path, flash: { success: t('.success') }
      else
        redirect_to new_backend_character_path, flash: { error: t('.failed') }
      end
    end

    def update
      controller_authorize(character)

      character.avatar.attach(params[:character][:image]) if params[:character][:image]

      if character.update(controller_permitted_attributes(character))
        redirect_to backend_character_path(character), flash: { success: t('.success') }
      else
        redirect_to backend_character_path(character), flash: { error: t('.failed') }
      end
    end

    private

    def character
      @character ||= Character.find_by(id: params[:id])
    end
  end
end
