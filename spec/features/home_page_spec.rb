require 'rails_helper'

feature "Showing bottles" do
  scenario "Show several bottles on home page" do
    bottle1 = create(:bottle, name: 'Fred', color: 'Blue')
    bottle2 = create(:bottle, name: 'Georgie', color: 'Red')
    visit root_path
    expect(page).to have_content bottle1.name
    expect(page).to have_content "Color: #{bottle1.color}"
    expect(page).to have_content bottle2.name
    expect(page).to have_content "Color: #{bottle2.color}"
  end
end
