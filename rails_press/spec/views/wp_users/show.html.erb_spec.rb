require 'spec_helper'

describe "wp_users/show" do
  before(:each) do
    @wp_user = assign(:wp_user, stub_model(WpUser,
      :user_login => "User Login",
      :user_pass => "User Pass",
      :user_nicename => "User Nicename",
      :user_email => "User Email",
      :user_url => "User Url",
      :user_activation_key => "User Activation Key",
      :user_status => 1,
      :display_name => "Display Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Login/)
    rendered.should match(/User Pass/)
    rendered.should match(/User Nicename/)
    rendered.should match(/User Email/)
    rendered.should match(/User Url/)
    rendered.should match(/User Activation Key/)
    rendered.should match(/1/)
    rendered.should match(/Display Name/)
  end
end
