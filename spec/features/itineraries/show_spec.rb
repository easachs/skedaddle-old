# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show Itinerary' do
  before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      { 'provider' => 'google_oauth2',
        'uid' => '123456',
        'info' => {
          'name' => 'John Doe',
          'email' => 'johndoe@example.com'
        },
        'credentials' => {
          'token' => 'TOKEN'
        } }
    )
    visit root_path

    click_button('Log in with Google')
  end

  it 'can delete parks and restaurants', vcr: 'denver_search' do
    expect(current_path).to eq(dashboard_path)
    visit '/itineraries/new?search=Denver'
    expect(page).to have_content('Denver Itinerary')
    click_button('Save')

    expect(page).to have_content('Denver Itinerary')
    within '#parks' do
      expect(page).to have_content('Apex Park')
      expect(page).to have_content('Bear Creek Regional Park')
      expect(page).to have_content('Black Forest Regional Park')
      within '#park-2' do
        click_on('Remove')
      end
      expect(page).to have_content('Apex Park')
      expect(page).to have_content('Bear Creek Regional Park')
      expect(page).to_not have_content('Black Forest Regional Park')
    end

    within '#restaurants' do
      expect(page).to have_content('The Savage Beet')
      expect(page).to have_content('Your Coffee Guy')
      expect(page).to have_content('Taco Block')
      within '#restaurant-1' do
        click_on('Remove')
      end
      expect(page).to have_content('The Savage Beet')
      expect(page).to_not have_content('Your Coffee Guy')
      expect(page).to have_content('Taco Block')
    end
  end
end
