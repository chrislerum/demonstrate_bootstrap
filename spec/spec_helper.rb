require 'shoulda-matchers'
Capybara.javascript_driver = :webkit
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.include Devise::TestHelpers, type: :controller
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

def pageme
  save_and_open_page
end

def screenshot
  save_and_open_screenshot
end

def signed_up_user(password: 'happy555')
  user = FactoryGirl.build(:user, password: password)
  visit root_path
  within '.navbar' do
    click_link 'Sign Up'
  end
  fill_in 'First Name', with: user.first_name
  fill_in 'Last Name', with: user.last_name
  fill_in 'Email Address', with: user.email
  within '#password' do
    fill_in 'user_password', with: password
  end
  within '#password_confirmation' do
    fill_in 'user_password', with: password
  end
  click_button 'Sign up'
  user
end

def sign_out_user
  visit root_path
  click_link 'Sign Out'
end
