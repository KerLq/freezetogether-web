class Frontend::SessionsController < Frontend::FrontendController
    def login

    end
    
    def create
        @user = User.find_by(email: params[:email]) # Change to email! also downcase
        if !!@user && @user.authenticate(params[:password])
            if @user.email_confirmed
                session[:user_id] = @user.id
                redirect_to frontend_user_path(@user)
            else
                redirect_to login_path, notice: "Please activate your account by following the 
                instructions in the account confirmation email you received to proceed"
            end
        else
            redirect_to login_path, notice: "Invalid Login!"
        end
        
    end

    def destroy
        session[:user_id] = nil
        redirect_to frontend_root_path # Landingpage (root_path)
    end
end
