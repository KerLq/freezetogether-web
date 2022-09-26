# frozen_string_literal: true

class Character < ApplicationRecord
  has_one_attached :image
  has_many :character_perks, dependent: :delete_all
end
