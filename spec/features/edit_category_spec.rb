require "rails_helper"

describe "edit category" do
  it "edits a category" do
    visit categories_path
    click_on 'Add a Category'
    fill_in 'Name', :with => 'My category'
    fill_in 'Description', :with => 'My description'
    click_on 'Create Category'
    click_on 'My category'
    click_on 'Edit'
    fill_in 'Name', :with => 'Your category'
    click_on 'Update Category'
    expect(page).to have_content 'Your'
  end

  it "gives error when no description is entered" do
    visit categories_path
    click_on 'Add a Category'
    fill_in 'Name', :with => 'My category'
    fill_in 'Description', :with => 'My description'
    click_on 'Create Category'
    click_on 'My category'
    click_on 'Edit'
    fill_in 'Description', :with => ''
    click_on 'Update Category'
    expect(page).to have_content 'errors'
  end
end
