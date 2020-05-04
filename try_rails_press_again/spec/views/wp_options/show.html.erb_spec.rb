require 'spec_helper'

describe "wp_options/show" do
  before(:each) do
    @wp_option = assign(:wp_option, stub_model(WpOption,
      :option_id => 1,
      :option_name => "Option Name",
      :option_value => "MyText",
      :autoload => "Autoload"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Option Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Autoload/)
  end
end
