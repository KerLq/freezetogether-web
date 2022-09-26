class Character < ApplicationRecord
  has_one_attached :image
  has_many :character_perks
end
