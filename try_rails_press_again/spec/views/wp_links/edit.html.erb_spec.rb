require 'spec_helper'

describe "wp_links/edit" do
  before(:each) do
    @wp_link = assign(:wp_link, stub_model(WpLink,
      :link_id => 1,
      :link_url => "MyString",
      :link_name => "MyString",
      :link_image => "MyString",
      :link_target => "MyString",
      :link_description => "MyString",
      :link_visible => "MyString",
      :link_owner => 1,
      :link_rating => 1,
      :link_rel => "MyString",
      :link_notes => "MyText",
      :link_rss => "MyString"
    ))
  end

  it "renders the edit wp_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wp_link_path(@wp_link), "post" do
      assert_select "input#wp_link_link_id[name=?]", "wp_link[link_id]"
      assert_select "input#wp_link_link_url[name=?]", "wp_link[link_url]"
      assert_select "input#wp_link_link_name[name=?]", "wp_link[link_name]"
      assert_select "input#wp_link_link_image[name=?]", "wp_link[link_image]"
      assert_select "input#wp_link_link_target[name=?]", "wp_link[link_target]"
      assert_select "input#wp_link_link_description[name=?]", "wp_link[link_description]"
      assert_select "input#wp_link_link_visible[name=?]", "wp_link[link_visible]"
      assert_select "input#wp_link_link_owner[name=?]", "wp_link[link_owner]"
      assert_select "input#wp_link_link_rating[name=?]", "wp_link[link_rating]"
      assert_select "input#wp_link_link_rel[name=?]", "wp_link[link_rel]"
      assert_select "textarea#wp_link_link_notes[name=?]", "wp_link[link_notes]"
      assert_select "input#wp_link_link_rss[name=?]", "wp_link[link_rss]"
    end
  end
end
