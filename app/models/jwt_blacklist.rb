# frozen_string_literal: true

class JwtBlacklist < ApplicationRecord
  def self.blacklist(token)
    create(token:)
  end
end
