class Frontend::UsersController < Frontend::FrontendController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :permission, only: %i[edit update destroy]
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
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
        redirect_to @user, notice: "Successfully registered!"
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    def permission
      if current_user != set_user
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
