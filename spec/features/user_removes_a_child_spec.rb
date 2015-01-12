require 'rails_helper'

feature "User removes a child" do

# As a user
# I want to remove a child that was added unnecessarily/inadvertently
# So I can ensure that the "/children" page has no superfluous information
#
# Acceptance Criteria:
#
# * I must remove an existing child
# * Upon successfully removing a child, I am redirected to "/children" and I am presented with a notification of success

  it "should display notice of success after removal of a child" do
    child_one = Child.create!(name: "Brittany Forsmo", age: 15)
    # Visit the page containing the "Delete child" button
    visit "/children/#{child_one.id}"
    click_link "Delete child"
    expect(page).to have_content("was removed")
  end

end
