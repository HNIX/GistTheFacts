require "rails_helper"

RSpec.feature "Creating post" do
  scenario "successfully" do
    visit root_path
    click_on "Write a gist"

    fill_in "Title", with: "My first gist"
    fill_in "Body", with: "A summary of what I am talking about"
    click_on "Publish"

    expect(page).to have_content "My first gist"
  end

  scenario "unsuccessfully" do
    visit root_path
    click_on "Write a gist"

    fill_in "Title", with: "My second gist"
    fill_in "Body", with: ""
    click_on "Publish"

    expect(page).to have_css ".error"
  end

end
