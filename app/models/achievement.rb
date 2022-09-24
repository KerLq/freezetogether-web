# frozen_string_literal: true

class Achievement < ApplicationRecord
  has_many :accomplished_achievements, dependent: :delete_all
  has_one_attached :cover_image
end
