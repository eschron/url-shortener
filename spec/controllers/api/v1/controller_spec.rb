require 'spec_helper'

feature "post and get information from database" do
  xscenario "returns 200 ok when successfully post data" do
    @new = Url.create!(shortened_url: "abcdefghij", original_url: "https://www.google.com", redirect_count: 0)
    visit "/"
    expect(response.status).to eq(200)
  end

  xscenario "returns error if not a valid url" do
    @new = Url.create!(shortened_url: "abcdefghij", original_url: "https://www.google.com", redirect_count: 0)
    visit "/"
    expect(response.status).to eq(500)
  end

  xscenario "returns error if did not post to database successfully" do
    @new = Url.create(original_url: "https://www.google.com", redirect_count: 0)
    visit "/"
    expect(response.status).to eq(500)
  end

  xscenario "returns list of all urls" do
    @new = Url.create!(shortened_url: "abcdefghij", original_url: "https://www.google.com", redirect_count: 0)
    visit "/api/v1/urls"
    data = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(data.size).to eq(1)
  end

  xscenario "returns url of specific id" do
    @new = Url.create!(shortened_url: "abcdefghij", original_url: "https://www.google.com", redirect_count: 0)
    visit "/api/v1/urls/1"
    data = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(data.size).to eq(1)
  end

  xscenario "returns error if specific id not valid" do
    @new = Url.create!(shortened_url: "abcdefghij", original_url: "https://www.google.com", redirect_count: 0)
    visit "/api/v1/urls/38472"
    data = JSON.parse(response.body)
    expect(response.status).to eq(404)
  end
end
