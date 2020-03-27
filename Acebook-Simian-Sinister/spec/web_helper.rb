
def sign_up_nuffmunz
    visit '/users/sign_up'
    fill_in 'user_first_name', with: 'Money'
    fill_in 'user_last_name', with: 'McBags'
    fill_in 'user_username', with: 'nuffmunz'
    fill_in 'user_email', with: 'rich@money.cash'
    fill_in 'user_password', with: 'Neopets 4eva'
    fill_in 'user_password_confirmation', with: 'Neopets 4eva'
    click_on 'Sign up'
end

def sign_up_with_picture_nuffmunz
  visit '/users/sign_up'
  fill_in 'user_first_name', with: 'Money'
  fill_in 'user_last_name', with: 'McBags'
  fill_in 'user_username', with: 'nuff munz'
  fill_in 'user_email', with: 'rich@money.cash'
  fill_in 'user_password', with: 'Neopets 4eva'
  fill_in 'user_password_confirmation', with: 'Neopets 4eva'
  attach_file("Profile picture", Rails.root + "spec/fixtures/monkeyboi.jpg")
  click_on 'Sign up'
end

def sign_up_eddie
  visit '/users/sign_up'
  fill_in 'user_first_name', with: 'Eddie'
  fill_in 'user_last_name', with: 'Book'
  fill_in 'user_username', with: 'Ebook'
  fill_in 'user_email', with: 'ed@aol.fr'
  fill_in 'user_password', with: 'Neopets 4eva'
  fill_in 'user_password_confirmation', with: 'Neopets 4eva'
  click_on 'Sign up'
end

def create_post_hello_world
  click_link 'Shout To The Jungle'
  fill_in 'Message', with: 'Hello, world!'
  click_button 'Submit'
end

def create_post_bah
  click_link 'Shout To The Jungle'
  fill_in 'Message', with: 'bah'
  click_button 'Submit'
end
