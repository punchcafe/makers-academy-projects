require 'rails_helper'
require 'web_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Users can register" do
    visit "/posts"
    expect(page).to_not have_content("Zorpd00d")
    auto_register
    visit "/posts"
    expect(page).to have_content("Zorpd00d")
  end
end
