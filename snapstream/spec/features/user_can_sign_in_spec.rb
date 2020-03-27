require 'rails_helper'
require 'web_helper'


RSpec.feature "Sign in", type: :feature do
  scenario "Users can sign in" do
    auto_register
    click_on "sign out"
    visit '/'
    p page.body
    click_on "sign in"
    fill_in "user[email]", with: "peter@aol.co.jp"
    fill_in "user[password]", with: "neopets4eva"
    click_on "Log in"
    visit "/"
    expect(page).to have_content("Zorpd00d")
  end
end
