require 'rails_helper'

RSpec.feature 'Sign', type: :feature do
  scenario 'Users can sign up' do
      visit '/users/sign_up'
      fill_in 'user_first_name', with: 'Money'
      fill_in 'user_last_name', with: 'McBags'
      fill_in 'user_username', with: 'nuffmunz'
      fill_in 'user_email', with: 'rich@money.cash'
      fill_in 'user_password', with: 'Neopets 4eva'
      fill_in 'user_password_confirmation', with: 'Neopets 4eva'
      click_on 'Sign up'
    expect(page).to have_content("Hakuna Matata, nuffmunz")
  end

  scenario 'User can attach a profile picture at signup' do
    sign_up_with_picture_nuffmunz
    expect(page.find('#profile-picture img')['src']).to have_content 'monkeyboi.jpg'
  end
end
