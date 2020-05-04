require 'spec_helper'

describe "wp_usermeta/new" do
  before(:each) do
    assign(:wp_usermetum, stub_model(WpUsermetum,
      :umeta_id => 1,
      :user_id => 1,
      :meta_key => "MyString",
      :meta_value => "MyText"
    ).as_new_record)
  end

  it "renders new wp_usermetum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wp_usermeta_path, "post" do
      assert_select "input#wp_usermetum_umeta_id[name=?]", "wp_usermetum[umeta_id]"
      assert_select "input#wp_usermetum_user_id[name=?]", "wp_usermetum[user_id]"
      assert_select "input#wp_usermetum_meta_key[name=?]", "wp_usermetum[meta_key]"
      assert_select "textarea#wp_usermetum_meta_value[name=?]", "wp_usermetum[meta_value]"
    end
  end
end
