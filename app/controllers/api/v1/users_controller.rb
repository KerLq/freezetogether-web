class Api::V1::UsersController < Api::V1::ApiController

  private
  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password
    )
  end

end