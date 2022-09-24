# frozen_string_literal: true

class AccomplishedAchievement < ApplicationRecord
  belongs_to :achievement
  delegate :title, :description, :cover_image, to: :achievement
  belongs_to :game
  has_one :user, through: :game
end
