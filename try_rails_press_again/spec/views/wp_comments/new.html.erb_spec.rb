require 'spec_helper'

describe "wp_comments/new" do
  before(:each) do
    assign(:wp_comment, stub_model(WpComment,
      :comment_ID => 1,
      :comment_post_ID => 1,
      :comment_author => "MyText",
      :comment_author_email => "MyString",
      :comment_author_url => "MyString",
      :comment_author_IP => "MyString",
      :comment_content => "MyText",
      :comment_karma => 1,
      :comment_approved => "MyString",
      :comment_agent => "MyString",
      :comment_type => "MyString",
      :comment_parent => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new wp_comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wp_comments_path, "post" do
      assert_select "input#wp_comment_comment_ID[name=?]", "wp_comment[comment_ID]"
      assert_select "input#wp_comment_comment_post_ID[name=?]", "wp_comment[comment_post_ID]"
      assert_select "textarea#wp_comment_comment_author[name=?]", "wp_comment[comment_author]"
      assert_select "input#wp_comment_comment_author_email[name=?]", "wp_comment[comment_author_email]"
      assert_select "input#wp_comment_comment_author_url[name=?]", "wp_comment[comment_author_url]"
      assert_select "input#wp_comment_comment_author_IP[name=?]", "wp_comment[comment_author_IP]"
      assert_select "textarea#wp_comment_comment_content[name=?]", "wp_comment[comment_content]"
      assert_select "input#wp_comment_comment_karma[name=?]", "wp_comment[comment_karma]"
      assert_select "input#wp_comment_comment_approved[name=?]", "wp_comment[comment_approved]"
      assert_select "input#wp_comment_comment_agent[name=?]", "wp_comment[comment_agent]"
      assert_select "input#wp_comment_comment_type[name=?]", "wp_comment[comment_type]"
      assert_select "input#wp_comment_comment_parent[name=?]", "wp_comment[comment_parent]"
      assert_select "input#wp_comment_user_id[name=?]", "wp_comment[user_id]"
    end
  end
end
