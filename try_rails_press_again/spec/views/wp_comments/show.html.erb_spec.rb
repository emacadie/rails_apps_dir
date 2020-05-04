require 'spec_helper'

describe "wp_comments/show" do
  before(:each) do
    @wp_comment = assign(:wp_comment, stub_model(WpComment,
      :comment_ID => 1,
      :comment_post_ID => 2,
      :comment_author => "MyText",
      :comment_author_email => "Comment Author Email",
      :comment_author_url => "Comment Author Url",
      :comment_author_IP => "Comment Author Ip",
      :comment_content => "MyText",
      :comment_karma => 3,
      :comment_approved => "Comment Approved",
      :comment_agent => "Comment Agent",
      :comment_type => "Comment Type",
      :comment_parent => 4,
      :user_id => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
    rendered.should match(/Comment Author Email/)
    rendered.should match(/Comment Author Url/)
    rendered.should match(/Comment Author Ip/)
    rendered.should match(/MyText/)
    rendered.should match(/3/)
    rendered.should match(/Comment Approved/)
    rendered.should match(/Comment Agent/)
    rendered.should match(/Comment Type/)
    rendered.should match(/4/)
    rendered.should match(/5/)
  end
end
