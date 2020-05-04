require 'spec_helper'

describe "wp_posts/edit" do
  before(:each) do
    @wp_post = assign(:wp_post, stub_model(WpPost,
      :post_author => 1,
      :post_content => "MyText",
      :post_title => "MyText",
      :post_excerpt => "MyText",
      :post_status => "MyString",
      :comment_status => "MyString",
      :ping_status => "MyString",
      :post_password => "MyString",
      :post_name => "MyString",
      :to_ping => "MyText",
      :pinged => "MyText",
      :post_content_filtered => "MyText",
      :post_parent => 1,
      :guid => "MyString",
      :menu_order => 1,
      :post_type => "MyString",
      :post_mime_type => "MyString",
      :comment_count => 1
    ))
  end

  it "renders the edit wp_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wp_posts_path(@wp_post), :method => "post" do
      assert_select "input#wp_post_post_author", :name => "wp_post[post_author]"
      assert_select "textarea#wp_post_post_content", :name => "wp_post[post_content]"
      assert_select "textarea#wp_post_post_title", :name => "wp_post[post_title]"
      assert_select "textarea#wp_post_post_excerpt", :name => "wp_post[post_excerpt]"
      assert_select "input#wp_post_post_status", :name => "wp_post[post_status]"
      assert_select "input#wp_post_comment_status", :name => "wp_post[comment_status]"
      assert_select "input#wp_post_ping_status", :name => "wp_post[ping_status]"
      assert_select "input#wp_post_post_password", :name => "wp_post[post_password]"
      assert_select "input#wp_post_post_name", :name => "wp_post[post_name]"
      assert_select "textarea#wp_post_to_ping", :name => "wp_post[to_ping]"
      assert_select "textarea#wp_post_pinged", :name => "wp_post[pinged]"
      assert_select "textarea#wp_post_post_content_filtered", :name => "wp_post[post_content_filtered]"
      assert_select "input#wp_post_post_parent", :name => "wp_post[post_parent]"
      assert_select "input#wp_post_guid", :name => "wp_post[guid]"
      assert_select "input#wp_post_menu_order", :name => "wp_post[menu_order]"
      assert_select "input#wp_post_post_type", :name => "wp_post[post_type]"
      assert_select "input#wp_post_post_mime_type", :name => "wp_post[post_mime_type]"
      assert_select "input#wp_post_comment_count", :name => "wp_post[comment_count]"
    end
  end
end
