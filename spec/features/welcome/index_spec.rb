require 'rails_helper'

RSpec.describe 'the welcome page', type: :feature do
  describe 'When a user visits the welcome page' do
    it 'has a button to return to the Home Page', :vcr do
      visit root_path

      click_on 'Home'

      expect(current_path).to eq(root_path)
    end

    it 'has a search bar', :vcr do
      visit root_path

      fill_in :search, with: "ill"
      click_on "Search"

      expect(page).to have_content('Schiller, Barrows and Parker')
      expect(page).to have_content('Tillman Group')
      expect(page).to have_content('Williamson Group')
      expect(page).to have_content('Williamson Group')
      expect(page).to have_content('Willms and Sons')
    end

    it 'returns alert when no matches are found', :vcr do
      visit root_path

      fill_in :search, with: "zzz"
      click_on "Search"

      expect(page).to have_content('No Merchants match search')
    end
    
    it 'returns alert when no text is filled into search bar', :vcr do
      visit root_path

      click_on "Search"

      expect(page).to have_content('Nothing to search, please try again')
    end
  end
end