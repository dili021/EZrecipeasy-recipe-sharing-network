require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  
  let!(:user) { create(:user) }
    
  it "Doesn't allow access to unregistered users" do
    visit root_path
    expect(current_path).to eq(login_path)
  end

  it "Signs the user with valid username" do
    visit '/login'
    fill_in "session_username",	with: user.username
    click_button 'Log In'
    expect(page).to have_content("Factory Bot")
  end
  
  it "Doesn't sign in with an invalid username" do
      visit '/login'
      fill_in "session_username",	with: "Not valid username"
      click_button 'Log In'
      expect(page).to have_content("Invalid username")
    end

  it "Logs the user out of the session" do
    visit '/login'
    fill_in "session_username",	with: user.username
    click_button 'Log In'
    click_on 'Log out'
    expect(page).to have_content("Don't have an account? Sign up now!")
  end

end
