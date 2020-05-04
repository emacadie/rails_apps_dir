require 'spec_helper'

describe "wp_usermeta/show" do
  before(:each) do
    @wp_usermetum = assign(:wp_usermetum, stub_model(WpUsermetum,
      :umeta_id => 1,
      :user_id => 2,
      :meta_key => "Meta Key",
      :meta_value => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Meta Key/)
    rendered.should match(/MyText/)
  end
end
