require 'spec_helper'

describe "wp_posts/index" do
  before(:each) do
    assign(:wp_posts, [
      stub_model(WpPost,
        :post_author => 1,
        :post_content => "MyText",
        :post_title => "MyText",
        :post_excerpt => "MyText",
        :post_status => "Post Status",
        :comment_status => "Comment Status",
        :ping_status => "Ping Status",
        :post_password => "Post Password",
        :post_name => "Post Name",
        :to_ping => "MyText",
        :pinged => "MyText",
        :post_content_filtered => "MyText",
        :post_parent => 2,
        :guid => "Guid",
        :menu_order => 3,
        :post_type => "Post Type",
        :post_mime_type => "Post Mime Type",
        :comment_count => 4
      ),
      stub_model(WpPost,
        :post_author => 1,
        :post_content => "MyText",
        :post_title => "MyText",
        :post_excerpt => "MyText",
        :post_status => "Post Status",
        :comment_status => "Comment Status",
        :ping_status => "Ping Status",
        :post_password => "Post Password",
        :post_name => "Post Name",
        :to_ping => "MyText",
        :pinged => "MyText",
        :post_content_filtered => "MyText",
        :post_parent => 2,
        :guid => "Guid",
        :menu_order => 3,
        :post_type => "Post Type",
        :post_mime_type => "Post Mime Type",
        :comment_count => 4
      )
    ])
  end

  it "renders a list of wp_posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Post Status".to_s, :count => 2
    assert_select "tr>td", :text => "Comment Status".to_s, :count => 2
    assert_select "tr>td", :text => "Ping Status".to_s, :count => 2
    assert_select "tr>td", :text => "Post Password".to_s, :count => 2
    assert_select "tr>td", :text => "Post Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Guid".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Post Type".to_s, :count => 2
    assert_select "tr>td", :text => "Post Mime Type".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
