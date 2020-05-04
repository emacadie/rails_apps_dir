require 'spec_helper'

describe "wp_options/new" do
  before(:each) do
    assign(:wp_option, stub_model(WpOption,
      :option_id => 1,
      :option_name => "MyString",
      :option_value => "MyText",
      :autoload => "MyString"
    ).as_new_record)
  end

  it "renders new wp_option form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wp_options_path, "post" do
      assert_select "input#wp_option_option_id[name=?]", "wp_option[option_id]"
      assert_select "input#wp_option_option_name[name=?]", "wp_option[option_name]"
      assert_select "textarea#wp_option_option_value[name=?]", "wp_option[option_value]"
      assert_select "input#wp_option_autoload[name=?]", "wp_option[autoload]"
    end
  end
end
