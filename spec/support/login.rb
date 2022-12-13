# frozen_string_literal: true

require 'rails_helper'

def login_user(**user_params)
  user = create(:user, password: 'BenSpencer', email_confirmed: true, **user_params)

  visit login_path

  fill_in 'email', with: user.email
  fill_in 'password', with: user.password
  click_button 'Login'
  expect(page).to have_content I18n.t('frontend.sessions.create.success')

  user
end
