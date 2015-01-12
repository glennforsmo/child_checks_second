require 'rails_helper'

feature "User adds a child" do

# As a user
# I want to add a child
# So that I can view the checkpoints of that child
#
# Acceptance Criteria:
#
# * I must specify a child name and age.
# * If I do not specify the required information, I am presented with errors.
# * If I specify the required information, the child is recorded and I am
#   redirected to the index of children

  it "adds a valid child" do
    # Visit the page containing the new child form
    visit '/children/new'

    # Fill in the input fields with the applicable "Name" and "Age"
    fill_in "Name", with: "Brittany Forsmo"
    fill_in "Age", with: 15
    click_on "Submit"

    expect(page).to have_content "was added!"
  end

  it "fails to add a child without the required information" do
    # Visit the page containing the new child form
    visit '/children/new'

    # Fill in the input fields with the applicable "Name" and "Age"
    fill_in "Name", with: " "
    fill_in "Age", with: " "
    click_on "Submit"

    expect(page).to have_content "can't be blank"
  end
end
