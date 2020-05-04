require 'spec_helper'

describe "wp_term_relationships/index" do
  before(:each) do
    assign(:wp_term_relationships, [
      stub_model(WpTermRelationship,
        :object_id => 1,
        :term_taxonomy_id => 2,
        :term_order => 3
      ),
      stub_model(WpTermRelationship,
        :object_id => 1,
        :term_taxonomy_id => 2,
        :term_order => 3
      )
    ])
  end

  it "renders a list of wp_term_relationships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
