require "rails_helper"

describe "user sign up" do
  scenario "user can create an account" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password1"
    click_on "Create User"

    expect(page).to have_content("You have successfully created an account")
  end
  scenario "user cannot create an account with email address that is already in use" do
    User.create(email: "erin@email.com", password: "password", password_confirmation: "password")
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password1"
    click_on "Create User"

    expect(page).to have_content("There was a problem. Email has already been taken. Please try again.")
  end
  scenario "user must having matching passwords" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Create User"

    expect(page).to have_content("There was a problem. Password confirmation doesn't match Password")
  end
  scenario "email cannot be blank" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Create User"

    expect(page).to have_content("There was a problem. Email can't be blank. Please try again.")
  end
  scenario "password cannot be blank" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Create User"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end
  scenario "password confirmation cannot be blank" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password]", with: "password1"
    click_on "Create User"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end
  scenario "user is logged in upon successful account creation" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    fill_in "user[email]", with: "erin@email.com"
    fill_in "user[password]", with: "password1"
    fill_in "user[password_confirmation]", with: "password1"
    click_on "Create User"

    user = User.last
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expect(page).to have_content("Log out")
    expect(page).to_not have_content("Login")
  end
end
