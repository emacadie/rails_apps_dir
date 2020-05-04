require 'spec_helper'

describe "wp_posts/show" do
  before(:each) do
    @wp_post = assign(:wp_post, stub_model(WpPost,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Post Status/)
    rendered.should match(/Comment Status/)
    rendered.should match(/Ping Status/)
    rendered.should match(/Post Password/)
    rendered.should match(/Post Name/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
    rendered.should match(/Guid/)
    rendered.should match(/3/)
    rendered.should match(/Post Type/)
    rendered.should match(/Post Mime Type/)
    rendered.should match(/4/)
  end
end
