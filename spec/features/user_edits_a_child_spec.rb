require 'rails_helper'

feature "User edits a child" do

# As a user
# I want to edit a child that was added with incorrect informtion
# So I can ensure that the "/children" page has accurate information
#
# Acceptance Criteria:
#
# * I must edit an existing child
# * If I do not specify the required information, I am presented with errors
# * Upon successfully editing a child, I am redirected to "/children" and I am presented with a notification of success

  it "should display notice after successfully editing a child" do
    child_one = Child.create!(name: "Brittany Forsmo", age: 15)
    # Visit the page containing the "Delete child" button
    visit "/children/#{child_one.id}"
    click_link "Edit child"
    fill_in "Name", with: "Brittany Nicole Forsmo"
    fill_in "Age", with: 15
    click_on "Submit"

    expect(page).to have_content("edit was completed")
  end

  it "should present errors if the required information for editing a child is not provided" do
    child_one = Child.create!(name: "Brittany Forsmo", age: 15)
    # Visit the page containing the "Delete child" button
    visit "/children/#{child_one.id}"
    click_link "Edit child"
    fill_in "Name", with: " "
    fill_in "Age", with: 15
    click_on "Submit"

    expect(page).to have_content("can't be blank")
  end


end
