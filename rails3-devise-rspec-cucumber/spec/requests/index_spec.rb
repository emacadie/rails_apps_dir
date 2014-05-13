require "spec_helper"

# include Devise::TestHelpers

describe "index page" do
  before(:all) do 
    @book  = FactoryGirl.create(:book)
    @book2 = FactoryGirl.create(:book2)
  end

  it "should not have a link to add a book if not logged in" do
    visit "/"
    page.should_not have_content("Add a new book")
  end

  it "gets a session from Provider and has a link to add a book" do
    p = SessionProvider.get_session
    visit "/"
    page.should have_content("Add a new book")
  end

end
