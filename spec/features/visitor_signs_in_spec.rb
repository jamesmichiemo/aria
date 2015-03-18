require 'rails_helper'

RSpec.feature 'Visitor signs up', :type => :feature do
  let(:username) { ENV['BEATPORT_USERNAME']}
  let(:password) { ENV['BEATPORT_PASSWORD'] }
  let(:email) { "omeichim+#{Faker::Number.number(10)}@gmail.com" }

  scenario 'with valid form data', :js => true do
      visit welcome_index_path

      click_link 'Sign in >>'
      fill_in 'Username', with: username
      fill_in 'Password', with: password
      click_button 'Authorize App'

      expect(page).to have_content(:username)
  end
end
