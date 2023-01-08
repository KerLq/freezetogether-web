module Frontend
  class ResetPasswordsController < Frontend::FrontendController
    def new
      controller_authorize(User)
    end

    def create_reset_password_link
      controller_authorize(User)

      user = User.find_by(email: params[:email])

      if user
        user.generate_reset_password_token
        UserMailer.reset_password_link(user).deliver!
      end


      respond_to do |format|
        format.html { render 'frontend/reset_passwords/successful' }
      end
    end
  end
end