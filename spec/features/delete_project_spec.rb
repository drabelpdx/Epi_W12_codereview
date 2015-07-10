require "rails_helper"

describe "edits project" do
  it "edits a project" do
    visit categories_path
    click_on 'Add a Category'
    fill_in 'Name', :with => 'My category'
    fill_in 'Description', :with => 'My description'
    click_on 'Create Category'
    click_on 'My category'
    click_on 'Add a Project'
    fill_in 'Name', :with => 'My project'
    fill_in 'Description', :with => 'My description'
    click_on 'Create Project'
    click_on 'My project'
    click_on 'Delete'
    expect(page).to have_content 'Projects'
  end

end
