require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New user'
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'Username', with: 'test2'
      fill_in 'Password', with: 'password'
      click_on 'Create New User'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content('test2')
    end

  end
end

feature 'logging in' do
  before(:each) do
    visit new_session_url
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'password'
    click_on 'LogIn'
  end

  scenario 'shows username on the homepage after login' do
    expect(page).to have_content('admin')
  end

end

feature 'logging out' do
  before(:each) do
    visit users_url
  end

  scenario 'begins with a logged out state' do
    expect(page).to have_content("Log In")
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    visit new_session_url
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'password'
    click_on 'Log In'

    visit users_url
    click_on 'Log Out'

    expect(page).not_to have_content('admin')
  end

end