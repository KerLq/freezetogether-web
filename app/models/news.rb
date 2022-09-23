# frozen_string_literal: true

class News < ApplicationRecord
  has_rich_text :content
  has_one_attached :cover_image
end
