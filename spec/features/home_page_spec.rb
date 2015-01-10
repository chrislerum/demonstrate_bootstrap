require 'rails_helper'

feature "Showing bottles" do
  before do
    @bottle = FactoryGirl.create(:bottle, name: 'Fred', color: 'Blue')
  end

  scenario "Show several bottles on home page" do
    @bottle2 = FactoryGirl.create(:bottle, name: 'Georgie', color: 'Red')
    visit root_path
    expect(page).to have_content @bottle2.name
    expect(page).to have_content "Color: #{@bottle2.color}"
  end

  scenario "When user clicks a bottle, show bottle detail page" do
    visit root_path
    click_link(@bottle.name.downcase)
  end

  after do
    expect(page).to have_content @bottle.name
    expect(page).to have_content "Color: #{@bottle.color}"
  end
end
