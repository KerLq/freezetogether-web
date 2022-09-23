# frozen_string_literal: true

module Backend
  class BackendController < ApplicationController
    layout 'backend'
    before_action :check_is_admin?

    def check_is_admin?
      redirect_to frontend_root_path unless is_admin?
    end
  end
end
