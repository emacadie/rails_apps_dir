require 'spec_helper'

describe "wp_commentmeta/new" do
  before(:each) do
    assign(:wp_commentmetum, stub_model(WpCommentmetum,
      :meta_id => 1,
      :comment_id => 1,
      :meta_key => "MyString",
      :meta_value => "MyText"
    ).as_new_record)
  end

  it "renders new wp_commentmetum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wp_commentmeta_path, "post" do
      assert_select "input#wp_commentmetum_meta_id[name=?]", "wp_commentmetum[meta_id]"
      assert_select "input#wp_commentmetum_comment_id[name=?]", "wp_commentmetum[comment_id]"
      assert_select "input#wp_commentmetum_meta_key[name=?]", "wp_commentmetum[meta_key]"
      assert_select "textarea#wp_commentmetum_meta_value[name=?]", "wp_commentmetum[meta_value]"
    end
  end
end
