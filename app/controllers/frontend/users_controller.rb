# frozen_string_literal: true

module Frontend
  class UsersController < Frontend::FrontendController
    def show
      authorize(user)
    end

    def new
      authorize(User)
      @user = User.new
    end

    def edit
      authorize(user)
    end

    def create
      authorize(User)

      user = User.new(permitted_attributes(User))
      user.avatar.attach(params[:user][:avatar])

      if user.save
        UserMailer.registration_confirmation(user).deliver!
        redirect_to login_path, flash: { success: t('.success') }
      else
        redirect_to register_path, flash: { success: t('.failed') }
      end
    end

    def update
      authorize(user)

      user.avatar.attach(params[:user][:avatar]) if params[:user][:avatar]

      if user.update(permitted_attributes(user))
        redirect_to frontend_user_path(user), flash: { success: t('.success') }
      else
        redirect_to frontend_user_path(user), flash: { error: t('.failed') }
      end
    end

    def destroy
      authorize(user)

      user.destroy

      redirect_to frontend_root_path
    end

    def confirm_email
      authorize(User.find_by(confirm_token: params[:id]))

      user = User.find_by(confirm_token: params[:id])
      if user
        user.email_activate
        redirect_to login_path, flash: { success: t('.success') } # Render special view for activation page
      else
        redirect_to frontend_root_path, flash: { error: t('.failed') }
      end
    end

    def upload_image
      authorize(User.find_by(id: params[:user_id]))

      user  = User.find_by(id: params[:user_id])
      image = params[:user][:avatar]
      user.avatar.attach(image)
      redirect_to frontend_user_path(user)
    end

    private

    def user
      @user ||= User.find_by(id: params[:id])
    end
  end
end
