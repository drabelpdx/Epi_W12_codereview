require "rails_helper"

describe "add project" do
  it "adds a new project to category" do
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
    expect(page).to have_content 'My project'
  end

  it "gives error when no name is entered" do
    visit categories_path
    click_on 'Add a Category'
    fill_in 'Name', :with => 'My category'
    fill_in 'Description', :with => 'My description'
    click_on 'Create Category'
    click_on 'My category'
    click_on 'Add a Project'
    click_on 'Create Project'
   expect(page).to have_content 'errors'
 end

end
