require 'rails_helper'

feature "Showing bottles" do
  scenario "Show several bottles on home page" do
    bottle1 = FactoryGirl.create(:bottle, name: 'Fred', color: 'Blue')
    bottle2 = FactoryGirl.create(:bottle, name: 'Georgie', color: 'Red')
    visit root_path
    expect(page).to have_content bottle1.name
    expect(page).to have_content "Color: #{bottle1.color}"
    expect(page).to have_content bottle2.name
    expect(page).to have_content "Color: #{bottle2.color}"
  end

  scenario "When user clicks a bottle, ask them to sign in" do
    bottle = FactoryGirl.create(:bottle, name: 'Fred', color: 'Blue')
    visit root_path
    click_link(bottle.name.downcase)
    expect(page).to have_no_content bottle.name
    expect(page).to have_no_content "Color: #{bottle.color}"
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
