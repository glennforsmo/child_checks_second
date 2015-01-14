require 'rails_helper'

feature "User removes a checkpoint" do

# As a user
# I want to remove a checkpoint
# So I can eliminate a checkpoint that was created in error
#
# Acceptance Criteria:
#
# * I must specify the checkpoint (an association between the checkpoint and an existing child should be created)
# * Only the checkpoints "School", "Home" and "Studies" will be accepted
# * If I enter all of the required information in the required formats, the checkpoint is recorded and I am presented with a notification of success
# * If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors
# * Upon successfully creating a checkpoint, I am redirected back to the index of checkpoints.

  it "should display that the checkpoint text was removed" do
    child_one = Child.create!(name: "Brittany Forsmo", age: 15)
    # Visit the page containing the new checkpoint form
    visit "/children/#{child_one.id}"
    txt_one = "School"
    fill_in "checkpoint[checkpoint]", :with => txt_one
    click_button "Submit"
    click_link "Delete"
    expect(page).to have_content("checkpoint was removed")
  end

  it "should no longer display the checkpoint that was removed" do
    child_one = Child.create!(name: "Brittany Forsmo", age: 15)
    # Visit the page containing the new checkpoint form
    visit "/children/#{child_one.id}"
    txt_one = "School"
    fill_in "checkpoint[checkpoint]", :with => txt_one
    click_button "Submit"
    click_link "Delete"
    visit "/children/#{child_one.id}"
    expect(page).not_to have_content(txt_one)
  end

end
