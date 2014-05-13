require "spec_helper"

# include Warden::Test::Helpers

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

  it "cannot make a new book without being signed in" do
    visit "/books/new"
    page.should have_content("You need to sign in or sign up before continuing")
  end

  it "gets a page to add book with session provider and has a link to add a new book" do
    p = SessionProvider.get_session
    visit "/books/new"
    # puts "Page is a #{page.class}"
    page.should have_content("New book")
  end

  it "adds a book from the new form" do
    book_count_start = Book.all.length
    
    p = SessionProvider.get_session

    visit "/books/new"
    # puts "Here is method of visit: #{self.method(:visit).owner} "
    title = SecureRandom.uuid
    review = SecureRandom.uuid
    fill_in "Title", :with =>  title
    fill_in "Review", :with => review
    click_button "Create Book"
    
    page.should have_content("Book was successfully created.")

    book_count_end = Book.all.length
    (book_count_end - book_count_start).should == 1
    
    Book.first.title.should == title
    Book.first.review.should == review
  end

  it "should update a book" do
    # pending "Don't do this one" # this will flag this test as pending
    book1  = FactoryGirl.create(:book)
    book2 = FactoryGirl.create(:book2)
    book_count_start = Book.all.length
    
    p = SessionProvider.get_session

    visit "/books/#{book1.id}/edit"
    # puts "Here is method of visit: #{self.method(:visit).owner} "
    title = SecureRandom.uuid
    review = SecureRandom.uuid
    fill_in "Title", :with =>  title
    fill_in "Review", :with => review
    click_button "Update Book"
    
    page.should have_content("Book was successfully updated.")

    book_count_end = Book.all.length
    book_count_end.should == book_count_start
    
    Book.first.title.should == title
    Book.first.review.should == review
  end

  xit "should delete a book" do    
    book1  = FactoryGirl.create(:book)
    book2 = FactoryGirl.create(:book2)
    book_count_start = Book.all.length
    
    p = SessionProvider.get_session
    puts "p.driver: #{p.driver}"
    # visit  
    # visit edit_user_path(useer)
    # DELETE /books/:id(.:format)
    path = 'books/' + book1.id.to_s
    puts "path: #{path}"
    destroy path #, data: "here"
  end

end
