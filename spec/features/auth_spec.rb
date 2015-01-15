require 'rails_helper'

feature "User registration" do
  scenario "User signs up for account" do
    password = 'happyface'
    user = FactoryGirl.create(:user, password: password)
    visit root_path
    within '.navbar' do
      click_link 'Sign Up'
    end
    fill_in 'Email', with: user.email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'

    visit root_path
    within '.navbar' do
      click_link 'Sign Up'
    end
    expect(page).to have_content 'Password confirmation'
    fill_in 'Email', with: 'myemail@gmail.com'
    fill_in 'Password', with: 'happy555'
    fill_in 'Password confirmation', with: 'happy555'
    click_button 'Sign up'

    expect(page).to have_content 'You have signed up successfully.'
    within '.navbar' do
      expect(page).to have_link 'Sign Out'
    end
  end

  scenario "User signs in to account" do
    password = 'happyface'
    user = sign_up_user(password: password)
    visit root_path
    within '.navbar' do
      click_link 'Sign In'
    end
    expect(page).to have_content 'Password'
    expect(page).to have_no_content 'confirmation'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: password
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  end
end
