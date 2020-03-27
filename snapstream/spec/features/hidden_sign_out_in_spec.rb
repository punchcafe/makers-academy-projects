require 'rails_helper'
require 'web_helper'


RSpec.feature "Hidden Sign in/out respectively", type: :feature do
  scenario "Users can't see sign out when not signed in" do
    visit('/')
    expect(page).to_not have_content("sign out")
  end
  scenario "Users can't see sign in when signed in" do
    auto_register
    visit '/'
    expect(page).to_not have_content("sign in")
  end
  scenario "Users can't see sign up when signed in" do
    auto_register
    visit '/'
    expect(page).to_not have_content("sign up")
  end
end
