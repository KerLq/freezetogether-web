# frozen_string_literal: true

json.array! @scores, partial: 'scores/score', as: :score
