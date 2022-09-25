# frozen_string_literal: true

module Backend
  class SessionsController < Backend::BackendController
    def new; end

    def create
      @user = User.find_by(email: params[:email]) # Change to email!
      if @user&.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to login_path, notice: (I18n.t 'backend.login.invalid')
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to users_path
    end
  end
end
