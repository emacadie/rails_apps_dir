require 'spec_helper'

describe "wp_usermeta/index" do
  before(:each) do
    assign(:wp_usermeta, [
      stub_model(WpUsermetum,
        :umeta_id => 1,
        :user_id => 2,
        :meta_key => "Meta Key",
        :meta_value => "MyText"
      ),
      stub_model(WpUsermetum,
        :umeta_id => 1,
        :user_id => 2,
        :meta_key => "Meta Key",
        :meta_value => "MyText"
      )
    ])
  end

  it "renders a list of wp_usermeta" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Meta Key".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
