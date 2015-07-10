require "rails_helper"

describe "edit category" do
  it "edits a category" do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :admin)
    category = FactoryGirl.create(:category)
    visit '/'
    click_on 'Add a Category'
    click_link('My category', match: :first)
    click_on 'Edit category'
    fill_in 'Name', :with => 'Your category'
    click_on 'Update Category'
    expect(page).to have_content 'Your'
  end

  it "gives error when no description is entered" do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :admin)
    category = FactoryGirl.create(:category)
    visit '/'
    click_on 'Add a Category'
    click_link('My category', match: :first)
    click_on 'Edit category'
    fill_in 'Description', :with => ''
    click_on 'Update Category'
    expect(page).to have_content 'errors'
  end
end
