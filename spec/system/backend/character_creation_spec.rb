# frozen_string_literal: true

require 'rails_helper'
require 'support/login'

RSpec.describe 'character creation', type: :system do
  it 'creates a character' do
    login_user(role: :admin)

    visit new_backend_character_path

    fill_in 'character_title', with: 'The Unforgiving'
    fill_in 'character_name', with: 'Ben o. Spencer'
    fill_in 'character_description', with: 'Certified Hero Chaser'
    attach_file('character_image', Rails.root + 'spec/images/test.png')

    click_button 'Create Character'

    expect(page).to have_text('Successfully created!')
    expect(page).to have_text('Ben o. Spencer')
  end
end
