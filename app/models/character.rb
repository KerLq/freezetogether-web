# frozen_string_literal: true

class Character < ApplicationRecord
  validates :title, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :quote, presence: true
  # validates :image, attached: true, content_type: ['image/png', 'image/jpeg', 'image/svg'] ## BUGFIX!

  has_rich_text :description
  has_rich_text :quote
  has_one_attached :image
end
