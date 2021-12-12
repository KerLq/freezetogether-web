class Backend::BackendController < ApplicationController
    #layout 'backend'
    before_action :is_admin?
    def is_admin?
        if !current_user.nil?
            if !current_user.admin?
                redirect_to users_path, notice: "No permission!"
            end
        end
    end
end
