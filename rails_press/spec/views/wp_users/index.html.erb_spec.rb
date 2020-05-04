require 'spec_helper'

describe "wp_users/index" do
  before(:each) do
    assign(:wp_users, [
      stub_model(WpUser,
        :user_login => "User Login",
        :user_pass => "User Pass",
        :user_nicename => "User Nicename",
        :user_email => "User Email",
        :user_url => "User Url",
        :user_activation_key => "User Activation Key",
        :user_status => 1,
        :display_name => "Display Name"
      ),
      stub_model(WpUser,
        :user_login => "User Login",
        :user_pass => "User Pass",
        :user_nicename => "User Nicename",
        :user_email => "User Email",
        :user_url => "User Url",
        :user_activation_key => "User Activation Key",
        :user_status => 1,
        :display_name => "Display Name"
      )
    ])
  end

  it "renders a list of wp_users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User Login".to_s, :count => 2
    assert_select "tr>td", :text => "User Pass".to_s, :count => 2
    assert_select "tr>td", :text => "User Nicename".to_s, :count => 2
    assert_select "tr>td", :text => "User Email".to_s, :count => 2
    assert_select "tr>td", :text => "User Url".to_s, :count => 2
    assert_select "tr>td", :text => "User Activation Key".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Display Name".to_s, :count => 2
  end
end
