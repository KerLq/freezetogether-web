class Backend::BackendController < ApplicationController
    #layout 'backend'
    before_action :check_is_admin?

    def check_is_admin?
        if !is_admin? 
            redirect_to frontend_root_path
        end
    end
end
