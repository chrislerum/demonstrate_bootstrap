Given(/^there's a "(.*?)" bottle named "(.*?)"$/) do |color, name|
  @bottle = FactoryGirl.create(:bottle, name: name, color: color)
end

When(/^I am on the homepage$/) do
  visit root_path
end

Then(/^I should see "(.*?)"$/) do |name|
  @bottle = Bottle.find_by_name(name)

  expect(page).to have_content(@bottle.name)
  expect(page).to have_content(@bottle.color)
end
