# require 'rspec/core'
# I am not too clear where I got this from, and I don't think I can use it in Capybara tests
# but I can use get_login_mine
module ControllerMacros

  # supeceded by SessionProvider
  def get_login_mine
    user = User.create(:name => "Joe",
                       :email    => "alindeman@example.com",
                       :password => "ilovegrapes",
                       :password_confirmation  => "ilovegrapes")

    visit "/users/sign_in"

    fill_in "Email",    :with => "alindeman@example.com"
    fill_in "Password", :with => "ilovegrapes"
    click_button "Sign in"

    page.should have_content("Signed in successfully.")

  end

end
