require "rails_helper"

feature "User visits the /children page" do

# As a user
# I want to visit the '/children' page
# So I can view the title of that page
#
# Acceptance Criteria:
#
# * I must successfully access the "/childern" page

  it "sees the 'ChildChecks' header" do
    visit "/children"
    expect(page).to have_content "ChildChecks"
  end
end
