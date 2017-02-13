require "rails_helper"

describe "login" do
  scenario "user can log in" do
    user = User.create(email: "email@example.com", password: "password", password_confirmation: "password")
    visit login_path

    fill_in "email", with: "email@example.com"
    fill_in "password", with: "password"
    click_on "Login"

    expect(page).to have_content("You have successfully logged in.")
    expect(current_path).to eq(root_path)
  end
  scenario "user sees error message if log in attempt was unsuccessful" do
    visit login_path
    fill_in "email", with: "email@example.com"
    click_on "Login"

    expect(page).to have_content("There was a problem logging in. Please try again.")
  end
end
