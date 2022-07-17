class Api::V1::JwtBlacklistsController < Api::V1::ApiController

  def create
    jwt_blacklist = JwtBlacklist.new(token: @@token)

    if jwt_blacklist.save
      render json: "0", status: :ok
    else
      render json: "-1", status: :unprocessable_entity
    end
  end
end
