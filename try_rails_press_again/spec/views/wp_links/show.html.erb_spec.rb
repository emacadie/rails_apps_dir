require 'spec_helper'

describe "wp_links/show" do
  before(:each) do
    @wp_link = assign(:wp_link, stub_model(WpLink,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Link Url/)
    rendered.should match(/Link Name/)
    rendered.should match(/Link Image/)
    rendered.should match(/Link Target/)
    rendered.should match(/Link Description/)
    rendered.should match(/Link Visible/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Link Rel/)
    rendered.should match(/MyText/)
    rendered.should match(/Link Rss/)
  end
end
