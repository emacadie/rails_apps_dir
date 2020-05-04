require 'spec_helper'

describe "wp_links/index" do
  before(:each) do
    assign(:wp_links, [
      stub_model(WpLink,
        :link_id => 1,
        :link_url => "Link Url",
        :link_name => "Link Name",
        :link_image => "Link Image",
        :link_target => "Link Target",
        :link_description => "Link Description",
        :link_visible => "Link Visible",
        :link_owner => 2,
        :link_rating => 3,
        :link_rel => "Link Rel",
        :link_notes => "MyText",
        :link_rss => "Link Rss"
      ),
      stub_model(WpLink,
        :link_id => 1,
        :link_url => "Link Url",
        :link_name => "Link Name",
        :link_image => "Link Image",
        :link_target => "Link Target",
        :link_description => "Link Description",
        :link_visible => "Link Visible",
        :link_owner => 2,
        :link_rating => 3,
        :link_rel => "Link Rel",
        :link_notes => "MyText",
        :link_rss => "Link Rss"
      )
    ])
  end

  it "renders a list of wp_links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Link Url".to_s, :count => 2
    assert_select "tr>td", :text => "Link Name".to_s, :count => 2
    assert_select "tr>td", :text => "Link Image".to_s, :count => 2
    assert_select "tr>td", :text => "Link Target".to_s, :count => 2
    assert_select "tr>td", :text => "Link Description".to_s, :count => 2
    assert_select "tr>td", :text => "Link Visible".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Link Rel".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Link Rss".to_s, :count => 2
  end
end
