require 'rails_helper'

RSpec.describe 'the merchants show page', type: :feature do
  describe 'When a user visits a merchants show page' do
    it 'has a button to return to the Home Page', :vcr do
      visit merchant_path(1)

      click_on 'Home'

      expect(current_path).to eq(root_path)
    end

    it 'displays merchant and all of its items', :vcr do
      visit merchant_path(1)

      expect(page).to have_content('Schroeder-Jerde')
      expect(page).to have_content('Item Nemo Facere')
      expect(page).to have_content('Description: Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.')
      expect(page).to have_content('Price per Unit: 42.91')
    end
  end
end