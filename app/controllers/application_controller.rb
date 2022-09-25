# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include self::PunditInit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def user_not_authorized
    fallback_location = current_user ? frontend_user_path(current_user) : frontend_root_path
    redirect_back(fallback_location:, flash: { error: t('errors.not_authorized') })
  end
end
