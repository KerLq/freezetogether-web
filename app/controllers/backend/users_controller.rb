# frozen_string_literal: true

module Backend
  class UsersController < Backend::BackendController
    def index
      controller_authorize(User)

      @users = User.all.order('id DESC')
    end

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

      if user.save
        session[:user_id] = user.id
        redirect_to new_backend_user_path, flash: { success: t('.success') }
      else
        redirect_to new_backend_user_path, flash: { error: t('.failed') }
      end
    end

    def update
      controller_authorize(user)

      if @user.update(permitted_attributes(user))
        redirect_to edit_backend_user_path(user), flash: { success: t('.success') }
      else
        redirect_to edit_backend_user_path(user), flash: { error: t('.failed') }
      end
    end

    def destroy
      controller_authorize(user)

      if user.destroy
        redirect_to backend_users_path, flash: { success: t('.success') }
      else
        redirect_to backend_user_path(user), flash: { error: t('.failed') }
      end
    end

    private

    def user
      @user ||= User.find_by(id: params[:id])
    end
  end
end
