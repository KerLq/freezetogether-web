# frozen_string_literal: true

require 'rails_helper'
require 'support/login'

RSpec.describe 'character creation', type: :system, js: true do
  it 'creates a character' do
    login_user(role: :admin)

    visit new_backend_character_path

    fill_in 'character_title', with: 'The Unforgiving'
    fill_in 'character_name', with: 'Ben o. Spencer'
    fill_in_rich_text_area 'character_description', with: 'Certified Hero Chaser'
    fill_in_rich_text_area 'character_quote', with: 'If not you, who else?'
    attach_file('character_image', Rails.root + 'spec/images/test.png')

    click_button 'Create'

    expect(page).to have_content I18n.t('backend.characters.create.success')
    expect(page).to have_text('Ben o. Spencer')
  end
end
