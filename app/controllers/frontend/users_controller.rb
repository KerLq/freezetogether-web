# frozen_string_literal: true

module Frontend
  class UsersController < Frontend::FrontendController
    def show
      controller_authorize(user)
    end

    def new
      controller_authorize(User)
      @user = User.new
    end

    def edit
      controller_authorize(user)
    end

    def create
      controller_authorize(User)

      user = User.new(permitted_attributes(User))
      user.avatar.attach(params[:user][:avatar])

      if user.save
        UserMailer.registration_confirmation(user).deliver!
        redirect_to login_path, flash: { success: t('.success') }
      else
        flash[:error] ||= []

        user.errors.each do |error|
          flash[:error] << error.message
        end

        redirect_to register_path
      end
    end

    def update
      controller_authorize(user)

      if user.update(permitted_attributes(user))
        token = JsonWebToken.encode(user_id: user.id, email: user.email, password: user.password)
        user.update_attribute(:token, token)
        redirect_to frontend_user_path(user), flash: { success: t('.success') }
      else
        redirect_to frontend_user_path(user), flash: { error: t('.failed') }
      end
    end

    def destroy
      controller_authorize(user)

      user.destroy

      redirect_to frontend_root_path
    end

    def confirm_email
      controller_authorize(User.find_by(confirm_token: params[:id]))

      user = User.find_by(confirm_token: params[:id])
      if user
        user.email_activate
        redirect_to login_path, flash: { success: t('.success') } # Render special view for activation page
      else
        redirect_to frontend_root_path, flash: { error: t('.failed') }
      end
    end

    def reset_password
      controller_authorize(User.find_by(reset_password_token: params[:id]))

      @user = User.find_by(reset_password_token: params[:id])

      return unless request.post?

      if user.update(permitted_attributes(user))
        user.update_attribute(:reset_password_token, nil)
        redirect_to login_path, flash: { success: t('.success') }
      else
        redirect_to reset_password_frontend_user_path, flash: { error: t('.failed') }
        # Das Passwort konnte leider nicht zurückgesetzt werden,
        # bitte sende eine E-Mail an: support@freezetogether.com
      end
    end

    def upload_image
      controller_authorize(User.find_by(id: params[:user_id]))

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
