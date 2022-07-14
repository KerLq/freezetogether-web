class JwtBlacklistController < ApplicationController

  def create
    jwt_blacklist = JwtBlacklist.new(jwt_blacklist_params)

    if jwt_black_lists.save
      render json: "0", status: ok
    else
      render json: "-1", status :unprocessable_entity
    end
  end

  def jwt_blacklist_params
    params.require(:jwt_blacklist).permit(
      :token
    )
  end
end
