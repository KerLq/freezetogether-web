# frozen_string_literal: true

json.extract! achievement, :id, :created_at, :updated_at
json.url achievement_url(achievement, format: :json)
