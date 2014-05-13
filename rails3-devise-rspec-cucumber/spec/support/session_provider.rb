require "spec_helper"

include Capybara::DSL
include Capybara::RSpecMatchers

  class SessionProvider
    attr_reader :the_session
    def self.get_session
      the_session ||= create_session
    end

    private
    def self.create_session
      user = User.create(:name => "Joe",
                       :email    => "alindeman@example.com",
                       :password => "ilovegrapes",
                       :password_confirmation  => "ilovegrapes")

      visit "/users/sign_in"
      # puts "Here is method of visit: #{self.method(:visit).owner} "

      fill_in "Email",    :with => "alindeman@example.com"
      fill_in "Password", :with => "ilovegrapes"
      click_button "Sign in"

      page.should have_content("Signed in successfully.")
=begin
      puts "Page is a #{page.class}"
      puts "page.mode: #{page.mode} which is a #{page.mode.class}"
      puts "page.app: #{page.app.class}" 
      puts "page.app.methods: #{page.app.methods.sort} "
      puts "page.app.instance_variable_names: #{page.app.instance_variable_names}"
      puts "page.app.instance_variable_get(@mapping): #{page.app.instance_variable_get("@mapping")}"
=end
      return page
    end
  end

