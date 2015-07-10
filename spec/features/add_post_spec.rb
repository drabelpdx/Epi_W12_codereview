require "rails_helper"

describe "add post" do
  it "adds a new post to site" do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :admin)
    visit '/'
    click_link('Blog', match: :first)
    click_on 'Add a Post'
    fill_in 'Title', :with => 'My post'
    fill_in 'Body', :with => 'a post'
    click_on 'Create Post'
    expect(page).to have_content 'My post'
  end

  it "gives error when no name is entered" do
    admin = FactoryGirl.create(:admin)
    login_as(admin, :scope => :admin)
    visit '/'
    click_link('Blog', match: :first)
    click_on 'Add a Post'
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end

end
