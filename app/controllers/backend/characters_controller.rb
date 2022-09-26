# frozen_string_literal: true

module Backend
  class CharactersController < Backend::BackendController
    def index
      authorize(Character)

      @characters = Character.all
    end

    def show
      authorize(character)
    end

    def new
      authorize(Character)

      @character = Character.new
    end

    def edit
      authorize(character)
    end

    def create
      authorize(Character)

      character = Character.new(permitted_attributes(Character))
      # character.image.attach(params[:user][:image])

      if character.save
        redirect_to backend_characters_path, flash: { success: t('.success') }
      else
        redirect_to [:frontend, character], flash: { success: t('.failed') }
      end
    end

    private

    def character
      @character ||= Character.find_by(id: params[:id])
    end
  end
end
