# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user register and login', type: :system do
  it 'register a user' do
    visit register_path

    expect do
      within 'form' do
        fill_in 'user_email', with: 'dasisteintest@gmail.com'
        fill_in 'user_username', with: 'Escalibursmasher'
        fill_in 'user_password', with: 'billigespasswort'
        click_button 'KOSTENLOS REGISTRIEREN'
      end
    end
    change { User.count }.by(1)
  end

  it 'logs in a existing user' do
    user = create(:user, password: 'ben', email_confirmed: true)

    visit login_path

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'Login'
    expect(page).to have_text('Successfully logged in!')
  end
end
