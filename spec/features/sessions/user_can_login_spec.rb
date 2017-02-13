require "rails_helper"

describe "login" do
  scenario "user can log in" do
    visit login_path
    fill_in "email", with: "email@example.com"
    fill_in "password", with: "password"

    expect(page).to have_content("You have successfully logged in.")
    expect(current_path).to eq(root_path)
  end
  xscenario "user sees error message if log in attempt was unsuccessful" do
    visit login_path
    fill_in "email", with: "email@example.com"

    expect(page).to have_content("There was a problem logging in. Please try again.")
  end
end
