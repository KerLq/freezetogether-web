class Frontend::UsersController < Frontend::FrontendController
  before_action :permission, only: %i[edit update destroy]
  # GET /users or /users.json

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end



  # POST /users or /users.json

  def create
    @user = User.new(user_params)
      if @user.save
        UserMailer.registration_confirmation(@user).deliver!
        redirect_to login_path, notice: "Verify your email"
      else
        redirect_to register_path, notice: "Registration failed!"
      end

  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      redirect_to login_path # Render special view for activation page
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to frontend_root_path
    end
  end

  private
    def permission
      if current_user != User.find(params[:id])
        redirect_to users_path, notice: "No Permission!"
      end
    end
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :username,
        :email,
        :password
      )
    end
end
