# frozen_string_literal: true

class ApplicationController < ActionController::Base
	include Pundit::Authorization

  helper_method :current_user
  helper_method :logged_in?
  helper_method :admin?
  helper_method :current_user?

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def admin?
    logged_in? ? current_user.admin? : false
  end

  def current_user?(user)
    current_user == user if logged_in?
  end
end
