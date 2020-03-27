require 'rails_helper'
require 'web_helper'

RSpec.feature 'Sign', type: :feature do
  scenario 'Users can sign up' do
    sign_up_nuffmunz
    expect(page).to have_content("Hakuna Matata, nuffmunz")
    click_on "Sign out"
    expect(page).to_not have_content("Hakuna Matata, nuffmunz")
  end
end