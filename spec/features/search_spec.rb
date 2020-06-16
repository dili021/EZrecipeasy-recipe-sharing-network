require 'rails_helper'

RSpec.feature 'Searches', type: :feature do
  let!(:user) { create(:user) }
  let!(:recipe) { create(:recipe, author: user) }

  it "returns the recipes that include the search
      keywords in their ingredient list" do
    visit login_path
    fill_in 'session_username',	with: user.username
    click_on 'Log In'
    fill_in 'q[ingredients_title_cont]',	with: 'broccoly'
    click_button('Search')
    expect(page).to have_content('amazing dish')
  end

  it "Returns nothing if there's no recipe with the given keyword" do
    visit login_path
    fill_in 'session_username',	with: user.username
    click_on 'Log In'
    fill_in 'q[ingredients_title_cont]',	with: 'pasta'
    click_button('Search')
    expect(page).not_to have_content('pasta')
  end
end
