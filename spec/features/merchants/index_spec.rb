require 'rails_helper'

RSpec.describe 'the merchants index page', type: :feature do
  describe 'When a user visits the merchants page' do
    it 'has a button to return to the Home Page', :vcr do
      visit merchants_path

      click_on 'Home'

      expect(current_path).to eq(root_path)
    end

    it 'displays all merchants', :vcr do
      visit merchants_path

      expect(page).to have_content('Schroeder-Jerde')
      expect(page).to have_content('Nader-Hyatt')
      expect(page).to have_content('Wisozk, Hoeger and Bosco')
    end
  end
end
