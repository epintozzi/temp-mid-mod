require "rails_helper"

describe "logout" do
  scenario "user can logout" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    click_on "Log out"

    expect(page).to have_content("You have successfully logged out.")
  end
end
