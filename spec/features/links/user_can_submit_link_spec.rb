require "rails_helper"

describe "user submits link" do
  scenario "an authorized user can submit a valid link" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    fill_in "link[url]", with: "http://www.google.com"
    fill_in "link[title]", with: "google title"
    click_on "Submit Link"

    expect(page).to have_content("Your link has been created")
  end
  scenario "an authorized user can't submit an invalid link" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    fill_in "link[url]", with: "google"
    fill_in "link[title]", with: "google title"
    click_on "Submit Link"

    expect(page).to have_content("There was a problem. Url is not a valid URL. Please try again.")
  end
end
