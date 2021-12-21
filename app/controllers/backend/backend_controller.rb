class Backend::BackendController < ApplicationController
    #layout 'backend'
    before_action :is_admin?

    def is_admin?
        is_admin? ? true : redirect_to root_path 
    end
end
