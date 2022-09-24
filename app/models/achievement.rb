class Achievement < ApplicationRecord
  has_many :accomplished_achievements
	has_one_attached :cover_image
end
