class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :is_admin?
    helper_method :is_current_user
    
    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end

    def logged_in?    
        !!current_user
    end

    def is_admin?
        logged_in? ? current_user.admin? : false
    end
    
    def is_current_user(user)
        if logged_in?
            current_user == user ? true : false
        end
    end
end
