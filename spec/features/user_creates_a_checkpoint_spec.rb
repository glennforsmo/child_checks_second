require 'rails_helper'

feature "User creates a checkpoint" do

# As a user
# I want to create a checkpoint
# So I can notify people of my progress
#
# Acceptance Criteria:
#
# * I must specify the checkpoint (an association between the checkpoint and an existing child should be created)
# * Only the checkpoints "School", "Home" and "Studies" will be accepted
# * If I enter all of the required information in the required formats, the checkpoint is recorded and I am presented with a notification of success
# * If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors
# * Upon successfully creating a checkpoint, I am redirected back to the index of checkpoints.

  it "should display the checkpoint text after creation" do
    child_one = Child.create!(name: "Brittany Forsmo", age: 15)
    # Visit the page containing the new checkpoint form
    visit "/children/#{child_one.id}"
    txt_one = "School"
    fill_in "checkpoint[checkpoint]", :with => txt_one
    click_button "Submit"
    expect(page).to have_content(txt_one)
  end

  it "should display an error when checkpoint information is not provided " do
    child_one = Child.create!(name: "Brittany Forsmo", age: 15)
    # Visit the page containing the new checkpoint form
    visit "/children/#{child_one.id}"
    txt_one = " "
    fill_in "checkpoint[checkpoint]", :with => txt_one
    click_button "Submit"
    expect(page).to have_content("can't be blank")
  end

end
