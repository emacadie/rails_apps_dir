require 'spec_helper'

describe "wp_options/index" do
  before(:each) do
    assign(:wp_options, [
      stub_model(WpOption,
        :option_id => 1,
        :option_name => "Option Name",
        :option_value => "MyText",
        :autoload => "Autoload"
      ),
      stub_model(WpOption,
        :option_id => 1,
        :option_name => "Option Name",
        :option_value => "MyText",
        :autoload => "Autoload"
      )
    ])
  end

  it "renders a list of wp_options" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Option Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Autoload".to_s, :count => 2
  end
end
