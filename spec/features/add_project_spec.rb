require "rails_helper"

describe "add project" do
  it "adds a new project to category" do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :admin)
    category = FactoryGirl.create(:category)
    project = FactoryGirl.create(:project)
    visit '/'
    click_on 'Add a Category'
    click_link('My category', match: :first)
    click_on 'Add a Project'
    expect(page).to have_content 'My'
  end

  it "gives error when no name is entered" do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :admin)
    category = FactoryGirl.create(:category)
    visit '/'
    click_on 'Add a Category'
    click_link('My category', match: :first)
    click_on 'Add a Project'
    click_on 'Create Project'
   expect(page).to have_content 'errors'
 end

end
