# frozen_string_literal: true

class Character < ApplicationRecord
  validates :title, presence: true
  validates :name, presence: true
  validates :description, presence: true

  has_one_attached :image
  has_many :character_perks, dependent: :delete_all
end
