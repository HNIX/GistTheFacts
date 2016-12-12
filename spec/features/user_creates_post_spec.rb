require "rails_helper"

RSpec.feature "Creating post" do
  let(:user) { User.create(username: "exampleuser", email: "example@example.com", password: 'password', password_confirmation: 'password') }

  scenario "successfully" do
    sign_in user

    visit root_path
    click_on "Write a gist"

    fill_in "Title", with: "My first gist"
    fill_in "Body", with: "A summary of what I am talking about"
    click_on "Publish"
    within(".posts") do
      expect(page).to have_content "My first gist"
      expect(page).to have_content "exampleuser"
    end
  end

  scenario "unsuccessfully" do
    sign_in user
    
    visit root_path
    click_on "Write a gist"

    fill_in "Title", with: "My second gist"
    fill_in "Body", with: ""
    click_on "Publish"

    expect(page).to have_css ".error"
  end

  scenario "non-logged in user cannot create post" do
    visit root_path
    click_on "Write a gist"

    expect(current_path).to eq(new_user_session_path)
  end

end
