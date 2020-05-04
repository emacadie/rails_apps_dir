require 'spec_helper'

describe "wp_terms/index" do
  before(:each) do
    assign(:wp_terms, [
      stub_model(WpTerm,
        :term_id => 1,
        :name => "Name",
        :slug => "Slug",
        :term_group => 2
      ),
      stub_model(WpTerm,
        :term_id => 1,
        :name => "Name",
        :slug => "Slug",
        :term_group => 2
      )
    ])
  end

  it "renders a list of wp_terms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
