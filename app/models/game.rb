# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :user
  has_one :accomplished_achievements
end
