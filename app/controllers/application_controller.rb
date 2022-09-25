# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include self::PunditInit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action do
    browser_lang = request.env['HTTP_ACCEPT_LANGUAGE'].try(:scan, /^[a-z]{2}/).try(:first).try(:to_sym)

    I18n.locale = browser_lang || I18n.default_locale if I18n.available_locales.include?(browser_lang)

    next unless session[:user_id]

    Current.user = User.find_by(id: session[:user_id])
  end

  def user_not_authorized
    fallback_location = Current.user ? frontend_user_path(Current.user) : frontend_root_path
    redirect_back(fallback_location:, flash: { error: t('errors.not_authorized') })
  end
end
