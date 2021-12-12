class Backend::BackendController < ApplicationController
    #layout 'backend'
    before_action :is_admin?
end
