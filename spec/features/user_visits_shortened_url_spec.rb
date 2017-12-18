require 'spec_helper'

feature "user visits shortened url" do
  xscenario "successfully redirects to target url" do
    @new = Url.create!(shortened_url: "abcdefghij", original_url: "https://www.google.com", redirect_count:0)
    visit "/abcdefghij"
    expect(page).to have_content("I'm Feeling Lucky")
  end
  scenario "unsuccessfully redirects to target url because invalid shortened url" do
    @new = Url.create!(shortened_url: "abcdefghij", original_url: "https://www.google.com", redirect_count:0)
    visit "/abcd"
    expect(page).to have_content("Not an existing shortened url. Not valid")
  end
end
