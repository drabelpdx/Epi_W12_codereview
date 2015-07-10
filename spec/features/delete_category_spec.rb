require "rails_helper"

describe "delete category" do
  it "deletes a category" do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :admin)
    category = FactoryGirl.create(:category)
    visit '/'
    click_on 'Add a Category'
    click_link('My category', match: :first)
    click_on 'Delete'
    expect(page).to have_content 'Category'
  end
end
