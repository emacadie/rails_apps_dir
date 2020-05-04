require 'spec_helper'

describe "wp_options/edit" do
  before(:each) do
    @wp_option = assign(:wp_option, stub_model(WpOption,
      :option_id => 1,
      :option_name => "MyString",
      :option_value => "MyText",
      :autoload => "MyString"
    ))
  end

  it "renders the edit wp_option form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wp_option_path(@wp_option), "post" do
      assert_select "input#wp_option_option_id[name=?]", "wp_option[option_id]"
      assert_select "input#wp_option_option_name[name=?]", "wp_option[option_name]"
      assert_select "textarea#wp_option_option_value[name=?]", "wp_option[option_value]"
      assert_select "input#wp_option_autoload[name=?]", "wp_option[autoload]"
    end
  end
end
