require 'rails_helper'

RSpec.feature "Sign out", type: :feature do
  scenario "Users can sign out" do
    auto_register
    visit "/posts"
    expect(page).to have_content("Zorpd00d")
    click_on "sign out"
    visit "/posts"
    expect(page).to_not have_content("Zorpd00d")
  end
end
