require 'spec_helper'

describe "wp_postmeta/new" do
  before(:each) do
    assign(:wp_postmetum, stub_model(WpPostmetum,
      :meta_id => 1,
      :post_id => 1,
      :meta_key => "MyString",
      :meta_value => "MyText"
    ).as_new_record)
  end

  it "renders new wp_postmetum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wp_postmeta_path, "post" do
      assert_select "input#wp_postmetum_meta_id[name=?]", "wp_postmetum[meta_id]"
      assert_select "input#wp_postmetum_post_id[name=?]", "wp_postmetum[post_id]"
      assert_select "input#wp_postmetum_meta_key[name=?]", "wp_postmetum[meta_key]"
      assert_select "textarea#wp_postmetum_meta_value[name=?]", "wp_postmetum[meta_value]"
    end
  end
end
