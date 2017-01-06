require "rails_helper"

RSpec.feature "Following users" do
  let(:user1) { create(:user, username: "User1")}
  let(:user2) { create(:user, username: "User2")}

  scenario "signed in user can follow and unfollow other users" do
    sign_in user1
    visit user_path(user2)
    expect(page).to have_content user2.username

    click_on "Follow"
    expect(page).not_to have_button("Follow")
    expect(page).to have_button("Unfollow")
  end
end
