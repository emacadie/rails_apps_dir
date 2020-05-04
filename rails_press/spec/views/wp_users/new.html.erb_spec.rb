require 'spec_helper'

describe "wp_users/new" do
  before(:each) do
    assign(:wp_user, stub_model(WpUser,
      :user_login => "MyString",
      :user_pass => "MyString",
      :user_nicename => "MyString",
      :user_email => "MyString",
      :user_url => "MyString",
      :user_activation_key => "MyString",
      :user_status => 1,
      :display_name => "MyString"
    ).as_new_record)
  end

  it "renders new wp_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wp_users_path, :method => "post" do
      assert_select "input#wp_user_user_login", :name => "wp_user[user_login]"
      assert_select "input#wp_user_user_pass", :name => "wp_user[user_pass]"
      assert_select "input#wp_user_user_nicename", :name => "wp_user[user_nicename]"
      assert_select "input#wp_user_user_email", :name => "wp_user[user_email]"
      assert_select "input#wp_user_user_url", :name => "wp_user[user_url]"
      assert_select "input#wp_user_user_activation_key", :name => "wp_user[user_activation_key]"
      assert_select "input#wp_user_user_status", :name => "wp_user[user_status]"
      assert_select "input#wp_user_display_name", :name => "wp_user[display_name]"
    end
  end
end
