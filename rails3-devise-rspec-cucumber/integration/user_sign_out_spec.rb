require "spec_helper"

describe "user sign out" do
  it 'signs out with visit' do 
    p = SessionProvider.get_session
    visit "/books/new"
    # puts "Page is a #{page.class}"
    page.should have_content("New book")
    visit "/users/sign_out"
    page.should have_content("Signed out successfully.")
  end

  xit 'signs out via link' do 
    p = SessionProvider.get_session
    visit "/books/new"
    # puts "Page is a #{page.class}"
    page.should have_content("New book")
    # look into http://stackoverflow.com/questions/6557311/no-route-matches-users-sign-out-devise-rails-3
    click_link("Logout")
    page.should have_content("Signed out successfully.")
  end

end
