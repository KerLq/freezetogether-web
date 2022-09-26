class CharacterPerk < ApplicationRecord
  belongs_to :perk
  belongs_to :character
end
