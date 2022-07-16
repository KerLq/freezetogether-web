class Api::V1::UsersController < Api::V1::ApiController

	def me
		render json: @current_user, status: :ok
	end

  private
  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password
    )
  end

end