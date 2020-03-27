require 'rails_helper'
require 'web_helper'

RSpec.feature 'visit root', type: :feature do
  scenario 'Anonymous users are redirected to sign up' do
    visit('/')
    expect(current_path).to eq('/users/sign_in')
  end
end

RSpec.feature 'visit root', type: :feature do
  scenario 'signed in users stay on root' do
    sign_up_nuffmunz
    visit('/')
    expect(current_path).to eq('/')
  end
end
