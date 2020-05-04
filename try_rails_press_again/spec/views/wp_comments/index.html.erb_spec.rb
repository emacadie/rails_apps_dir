require 'spec_helper'

describe "wp_comments/index" do
  before(:each) do
    assign(:wp_comments, [
      stub_model(WpComment,
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
      ),
      stub_model(WpComment,
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
      )
    ])
  end

  it "renders a list of wp_comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Comment Author Email".to_s, :count => 2
    assert_select "tr>td", :text => "Comment Author Url".to_s, :count => 2
    assert_select "tr>td", :text => "Comment Author Ip".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Comment Approved".to_s, :count => 2
    assert_select "tr>td", :text => "Comment Agent".to_s, :count => 2
    assert_select "tr>td", :text => "Comment Type".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
