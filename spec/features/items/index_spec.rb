require 'rails_helper'

RSpec.describe 'the items index page', type: :feature do
  describe 'When a user visits the items page' do
    it 'has a button to return to the Home Page', :vcr do
      visit items_path

      click_on 'Home'

      expect(current_path).to eq(root_path)
    end

    it 'displays all items', :vcr do
      visit items_path

      expect(page).to have_content('Item Nemo Facere')
      expect(page).to have_content('Shiny Itemy Item')
      expect(page).to have_content('Item Ea Voluptatum')
    end
  end
end