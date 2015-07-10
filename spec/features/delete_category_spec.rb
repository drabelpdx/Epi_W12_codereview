require "rails_helper"

describe "delete category" do
  it "deletes a category" do
    visit categories_path
    click_on 'Add a Category'
    fill_in 'Name', :with => 'My category'
    fill_in 'Description', :with => 'My description'
    click_on 'Create Category'
    click_on 'My category'
    click_on 'Delete'
    expect(page).to have_content 'Categories'
  end
end
