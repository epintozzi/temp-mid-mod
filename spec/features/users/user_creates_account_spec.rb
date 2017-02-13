require "rails_helper"

describe "user sign up" do
  scenario "user can create an account" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password1"

    expect(page).to have_content("You have successfully created an account")
  end
  xscenario "user cannot create an account with email address that is already in use" do
    user = User.create(email: "erin@email.com", password: "password", password_confirmation: "password")
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password1"

    expect(page).to have_content("Email address is already in use. Please log in or try again.")
  end
  xscenario "user must having matching passwords" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password"

    expect(page).to have_content("Passwords do not match. Please try again")
  end
  xscenario "email cannot be blank" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password"

    expect(page).to have_content("Email cannot be blank.")
  end
  xscenario "password cannot be blank" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password_confirmation]", with: "password"

    expect(page).to have_content("Password cannot be blank.")
  end
  xscenario "password confirmation cannot be blank" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password]", with: "password1"

    expect(page).to have_content("Password Confirmation cannot be blank.")
  end
end
