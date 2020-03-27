require 'rails_helper'
require 'web_helper'

RSpec.feature "Add a message to a post", type: :feature do
  scenario "Can add a message to their post" do
    auto_register
    visit "/posts/"
    expect(page).to_not have_content("This is a great message")
    visit "/posts/new"
    fill_in "post[message]", with: "This is a great message"
    click_button "Create Post"
    visit "/posts/"
    expect(page).to have_content("This is a great message")
  end
end
