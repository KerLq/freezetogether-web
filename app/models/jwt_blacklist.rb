class JwtBlacklist < ApplicationRecord
  def self.blacklist(token)
		create(token: token)
	end
end
