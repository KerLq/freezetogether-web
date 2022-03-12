class Score < ApplicationRecord
    belongs_to :user
    has_many :achievements
end
