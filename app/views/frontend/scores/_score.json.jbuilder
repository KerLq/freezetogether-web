# frozen_string_literal: true

json.extract! score, :id, :created_at, :updated_at
json.url score_url(score, format: :json)
