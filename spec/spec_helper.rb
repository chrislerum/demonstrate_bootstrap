require 'shoulda-matchers'
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

def pageme
  save_and_open_page
end

def sign_up_user(password: 'happy555')
  user = FactoryGirl.create(:user, password: password)
  visit root_path
  within '.navbar' do
    click_link 'Sign Up'
  end
  fill_in 'Email', with: user.email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
  user
end

def sign_in_user(email:, password:)

end
