require "rails_helper"

feature "User views the list of children on the 'index' page" do

  # As a user
  # I want to view a list of children on the "/children" page
  # So I can see all listed children
  #
  # Acceptance Criteria:
  #
  # * I must be able to view all listed children

  it "sees the list of children on the index page" do
    child_one = Child.create!(name: "Brittany Forsmo", age: 15)
    child_two = Child.create!(name: "Courtney Forsmo", age: 16)
    visit "/children"
    expect(page).to have_content child_one.name
    expect(page).to have_content child_two.name
  end
end
