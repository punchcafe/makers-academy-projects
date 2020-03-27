require 'rails_helper'
require 'web_helper'


RSpec.feature "Other users posts don't display edit/delte options", type: :feature do
  scenario "Other users posts don't display delete options" do
    auto_reg_post
    visit('/')
    expect(page).to have_content("Destroy")
    click_on ('sign out')
    manual_register("newboy","newboy@aol.com")
    visit('/')
    expect(page).to_not have_content("Destroy")
  end

  scenario "Other users posts don't display edit options" do
    auto_reg_post
    visit('/')
    expect(page).to have_content("Edit")
    click_on ('sign out')
    manual_register("newboy","newboy@aol.com")
    visit('/')
    expect(page).to_not have_content("Edit")
  end
end
