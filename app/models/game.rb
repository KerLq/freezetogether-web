# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :user
  has_many :accomplished_achievements
end
