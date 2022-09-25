# frozen_string_literal: true

module Frontend
  class UsersController < Frontend::FrontendController
    before_action :permission, only: %i[edit update destroy]

    def show
      user
    end

    def new
      @user = User.new
    end

    def edit; end

    def create
      user = User.new(user_params)
      user.avatar.attach(params[:user][:avatar])

      if user.save
        UserMailer.registration_confirmation(user).deliver!
        redirect_to login_path, notice: (I18n.t 'frontend.register.verfiy_email')
      else
        redirect_to register_path, notice: (I18n.t 'frontend.register.failed')
      end
    end

    def update
      user.avatar.attach(params[:user][:avatar])

      respond_to do |format|
        if user.update(user_params)
          format.html { redirect_to user }
          format.json { render :show, status: :ok, location: user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: user.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      user.destroy
      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
      end
    end

    def confirm_email
      user = User.find_by(confirm_token: params[:id])
      if user
        user.email_activate
        redirect_to login_path # Render special view for activation page
      else
        flash[:error] = (I18n.t 'frontend.user.does_not_exist')
        redirect_to frontend_root_path
      end
    end

    def upload_image
      user  = User.find(params[:user_id])
      image = params[:user][:avatar]
      user.avatar.attach(image)
      redirect_to frontend_user_path(user)
    end

    private

    def permission
      redirect_to users_path, notice: (I18n.t 'frontend.user.no_permission') if current_user != User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :username,
        :email,
        :password,
        :avatar
      )
    end

    def user
      @user ||= User.find_by(id: params[:id])
    end
  end
end
