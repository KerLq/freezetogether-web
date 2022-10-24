# frozen_string_literal: true

class Faq < ApplicationRecord
  enum :category, [ :draft, :general, :game ]
end
