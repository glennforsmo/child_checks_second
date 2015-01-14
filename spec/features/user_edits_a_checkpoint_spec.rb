require 'rails_helper'

feature "User edits a checkpoint" do

# As a user
# I want to edit a checkpoint
# So I can correct a checkpoint that was created with incorrect information
#
# Acceptance Criteria:
#
# * I must specify the checkpoint (an association between the checkpoint and an existing child should be created)
# * Only the checkpoints "School", "Home" and "Studies" will be accepted
# * If I enter all of the required information in the required formats, the checkpoint is recorded and I am presented with a notification of success
# * If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors
# * Upon successfully creating a checkpoint, I am redirected back to the index of checkpoints.

  it "should display that the checkpoint text was successfully edited" do
    child_one = Child.create!(name: "Brittany Forsmo", age: 15)
    # Visit the page containing the new checkpoint form
    visit "/children/#{child_one.id}"
    txt_one = "School"
    txt_two = "Home"
    fill_in "checkpoint[checkpoint]", :with => txt_one
    click_button "Submit"
    click_link "Edit"
    fill_in "checkpoint[checkpoint]", :with => txt_two
    click_button "Submit"
    expect(page).to have_content("checkpoint edit was completed")
  end

  it "should display the newly-modified checkpoint text" do
    child_one = Child.create!(name: "Brittany Forsmo", age: 15)
    # Visit the page containing the new checkpoint form
    visit "/children/#{child_one.id}"
    txt_one = "School"
    txt_two = "Home"
    fill_in "checkpoint[checkpoint]", :with => txt_one
    click_button "Submit"
    click_link "Edit"
    fill_in "checkpoint[checkpoint]", :with => txt_two
    click_button "Submit"
    expect(page).to have_content(txt_two)
  end

end
