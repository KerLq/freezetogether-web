# frozen_string_literal: true

class Faq < ApplicationRecord
  enum :category, %i[draft general game]
end
