require 'rails_helper'
require 'web_helper'


RSpec.feature "User can comment on posts", type: :feature do
  scenario "user can add a comment to a post" do
    auto_reg_post
    visit('/')
    fill_in "message_contents", with: "what a great comment"
    click_on ('comment')
    visit('/')
    expect(page).to have_content("what a great comment")
  end
end
