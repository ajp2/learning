require 'rails_helper'

feature "creating a goal" do
  before(:each) do
    visit new_session_url
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'password'
    click_on 'LogIn'
    visit new_goal_url
  end

  scenario "has a new goal page" do
    expect(page).to have_content("New Goal")
  end

  scenario "redirects to the goal show page" do
    fill_in 'Title', with: 'testing'
    fill_in 'Details', with: 'testing'
    click_on 'Submit'

    expect(page).to have_content("testing")
  end
end

feature "completing a goal" do
  scenario "shows completed in goal show page"
  scenario "changes back to ongoing if clicked again"
end

feature "deleting a goal" do
  scenario "redirects to goals index page"
  scenario "goal does not appear on page"
end
