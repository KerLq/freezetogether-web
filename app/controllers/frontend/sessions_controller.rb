# frozen_string_literal: true

module Frontend
  class SessionsController < Frontend::FrontendController
    def new
      controller_authorize(User)
    end

    def create
      controller_authorize(User)

      @user = User.find_by('lower(email) = ?', params[:email].downcase)
      if @user&.authenticate(params[:password])
        if @user.email_confirmed
          if params[:remember_me].to_i == 1
            cookies.permanent[:auth_token] = @user.id
          else
            session[:user_id] = @user.id
          end

          redirect_to frontend_user_path(@user), flash: { success: t('.success') }
        else
          UserMailer.registration_confirmation(@user).deliver!
          redirect_to login_path, flash: { error: t('.confirm_email') }
        end
      else
        redirect_to login_path, flash: { error: t('.failed') }
      end
    end

    def destroy
      controller_authorize(User)
      
      cookies[:auth_token] = nil
      session[:user_id] = nil 
      redirect_to frontend_root_path
    end
  end
end
