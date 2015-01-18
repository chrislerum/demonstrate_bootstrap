require 'rails_helper'

feature "User registration" do
  scenario "User signs up for account and is automatically signed in", js: true do
    first_name, last_name, password = 'Henry', 'Talbot', 'happyface'
    visit root_path
    within '.navbar' do
      click_link 'Sign Up'
    end
    expect(page).to have_content 'Password Confirmation'
    fill_in 'First Name', with: first_name
    fill_in 'Last Name', with: last_name
    fill_in 'Email Address', with: 'hellothere@gmail.com'
    within '#password' do
      fill_in 'user_password', with: password
    end
    within '#password_confirmation' do
      fill_in 'user_password', with: password
    end
    click_button 'Sign up'

    expect(page).to have_content 'You have signed up successfully.'
    within '.navbar' do
      expect(page).to have_link 'Sign Out'
    end
  end

  scenario "User signs in to account and sees his name", js: true do
    password = 'happyface'
    user = signed_up_user(password: password)
    sign_out_user
    visit root_path
    within '.navbar' do
      click_link 'Sign In'
    end
    fill_in 'Email Address', with: user.email
    within '#password' do
      fill_in 'user_password', with: password
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content "#{user.first_name} #{user.last_name}"
  end
end
