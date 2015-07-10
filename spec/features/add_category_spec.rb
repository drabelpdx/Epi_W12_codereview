require "rails_helper"

describe "add category" do
  it "adds a new category to site" do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :admin)
    category = FactoryGirl.create(:category)
    visit '/'
    click_on 'Add a Category'
    expect(page).to have_content 'My'
  end

  it "gives error when no name is entered" do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :admin)
    visit '/'
    click_on 'Add a Category'
    click_on 'Create Category'
   expect(page).to have_content 'errors'
 end

end
