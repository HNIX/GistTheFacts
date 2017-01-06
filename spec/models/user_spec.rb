require 'rails_helper'

RSpec.describe User do
  describe "following and unfollowing other users" do
    let(:user1) { create(:user, username: "User1" )}
    let(:user2) { create(:user, username: "User2" )}

    it "adds relationships between the two users" do
      user1.follow(user2)
      expect(user1.following?(user2)).to be_truthy
      expect(user2.followers).to include(user1)

      user1.unfollow(user2)
      expect(user2.followers).not_to include(user1)
    end
  end
end
