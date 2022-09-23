# frozen_string_literal: true

class Badge < ApplicationRecord
  has_one_attached :image
end
