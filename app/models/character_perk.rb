# frozen_string_literal: true

class CharacterPerk < ApplicationRecord
  belongs_to :perk
  belongs_to :character
  delegate :name, :image, to: :perk
end
