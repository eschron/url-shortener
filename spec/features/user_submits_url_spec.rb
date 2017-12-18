require 'spec_helper'

feature "user submits a url" do
  scenario "successfully gets standarized, shortened url back" do
    visit "/"
    fill_in('original_url', with: 'http://www.example.com')
    click_button "Shorten url"

    expect(page).to have_content("Here is your shortened url:")
  end

  scenario "fails because not valid url" do
    visit "/"
    fill_in('original_url', with: 'www.google.com')
    click_button "Shorten url"

    expect(page).to have_content("Not a valid url. Please enter a url in the format: http://www.example.com/path")
  end
end
