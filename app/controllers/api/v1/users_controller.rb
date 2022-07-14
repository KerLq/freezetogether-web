class Api::V1::UsersController < Api::V1::ApiController
  
  def index
  end
  
  def index
    @user = User.find_by(username: params[:username])
    if @user
      render json: @user.email, status: :ok
    else
      render json: '-1', status: :unprocessable_entity
    end
  end

  def create

  end

  def update

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