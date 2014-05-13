require "spec_helper"

include Warden::Test::Helpers

# note: To print out the html for a step do this:
# puts "page.html: #{page.html}"

describe "new book sign in" do
  it "tries to go to new book page without being logged in" do
    visit "/books/new"
    page.should have_content("You need to sign in or sign up before continuing")
  end
  
  it "allows users to add a book after they have registered" do
    
    user = User.create(:name => "Joe",
                       :email    => "alindeman@example.com",
                       :password => "ilovegrapes",
                       :password_confirmation  => "ilovegrapes")
    visit "/users/sign_in"

    fill_in "Email",    :with => "alindeman@example.com"
    fill_in "Password", :with => "ilovegrapes"
    click_button "Sign in"

    page.should have_content("Signed in successfully.")

    visit "/books/new"
    page.should have_content("New book")
   
  end

  it "uses my extracted login method" do
    p = SessionProvider.get_session
    visit "/books/new"
    # puts "Here is the page: #{page.html}"
    page.should have_content("New book")
  end

  it "tries to make a new book without being signed in" do
    visit "/books/new"
    page.should have_content("You need to sign in or sign up before continuing")
  end

end
