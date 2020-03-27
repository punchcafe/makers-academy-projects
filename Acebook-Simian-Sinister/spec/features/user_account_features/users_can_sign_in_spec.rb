require 'rails_helper'
require 'web_helper'

RSpec.feature 'Sign in', type: :feature do
  scenario 'Users can sign in' do
    sign_up_nuffmunz
    expect(page).to have_content("Hakuna Matata, nuffmunz")
    click_on "Sign out"
    expect(page).to_not have_content("Hakuna Matata, nuffmunz")
    fill_in 'user_email', with: 'rich@money.cash'
    fill_in 'user_password', with: 'Neopets 4eva'
    click_on 'sign in'
    expect(page).to have_content("Hakuna Matata, nuffmunz")
  end
end
