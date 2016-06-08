require 'rails_helper'

RSpec.feature "Visitor Creates Account" do
  scenario "visitor creates account; sees user dasboard" do

    visit login_path

    click_on "Create Account"
    fill_in "First name", with: "Roger"
    fill_in "Last name", with: "Smith"
    fill_in "Email", with: "rsmith@gmail.com"
    fill_in "Username", with: "turing123"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create Account"

    within (".navbar") do
      expect(page).to have_content("Logged in as Roger")
    end

    within (".navbar") do
      expect(page).to have_content("Logout")
    end

    within (".navbar") do
      expect(page).to have_no_content("Login")
    end

    expect(page).to have_content("My Dashboard")

    within (".user_info") do
      expect(page).to have_content("First Name: Roger")
    end

    within (".user_info") do
      expect(page).to have_content("Email: rsmith@gmail.com")
    end
  end
end
