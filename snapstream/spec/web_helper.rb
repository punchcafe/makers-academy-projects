def auto_register
  visit "/users/sign_up"
  fill_in "user[username]", with: "Zorpd00d"
  fill_in "user[email]", with: "peter@aol.co.jp"
  fill_in "user[password]", with: "neopets4eva"
  fill_in "user[password_confirmation]", with: "neopets4eva"
  click_button "Sign up"
end

def auto_reg_post
  visit "/users/sign_up"
  fill_in "user[username]", with: "Zorpd00d"
  fill_in "user[email]", with: "peter@aol.co.jp"
  fill_in "user[password]", with: "neopets4eva"
  fill_in "user[password_confirmation]", with: "neopets4eva"
  click_button "Sign up"
  visit "/posts/new"
  fill_in "post[message]", with: "This is a great message"
  click_button "Create Post"
end

def manual_register(user,email)
  visit "/users/sign_up"
  fill_in "user[username]", with: user
  fill_in "user[email]", with: email
  fill_in "user[password]", with: "neopets4eva"
  fill_in "user[password_confirmation]", with: "neopets4eva"
  click_button "Sign up"
end

def manual_post(body)
  visit "/posts/new"
  fill_in "post[message]", with: body
  click_button "Create Post"
end
