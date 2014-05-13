require "spec_helper"

describe "user sign in" do
  it "allows users to sign in after they have registered" do
    user = User.create(:name => "Joe",
                       :email    => "alindeman@example.com",
                       :password => "ilovegrapes",
                       :password_confirmation  => "ilovegrapes")
    visit "/users/sign_in"

    fill_in "Email",    :with => "alindeman@example.com"
    fill_in "Password", :with => "ilovegrapes"
    # fill_in "Email",    :with => @user.email
    # fill_in "Password", :with => @user.password

    click_button "Sign in"

    page.should have_content("Signed in successfully.")
  end
end

