require 'spec_helper'

feature "user sees existing shortened urls" do
  xscenario "sees list of already created urls" do
    @new = Url.create!(shortened_url: "abcdefghij", original_url: "https://www.google.com", redirect_count: 0)
    visit "/"
    expect(page).to have_content("Target Url: https://www.google.com")
    expect(page).to have_content("Shortened Url: https://localhost:4567/abcdefghij")
    expect(page).to have_content("Redirect count: 0")
  end
end
