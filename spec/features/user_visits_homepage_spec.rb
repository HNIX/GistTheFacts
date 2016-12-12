require 'rails_helper'

RSpec.feature "user visits homepage" do
  scenario "successfully and sees a logo" do
    visit root_path
    expect(page).to have_content "Gist The Facts"
  end

end
