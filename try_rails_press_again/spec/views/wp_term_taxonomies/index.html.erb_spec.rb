require 'spec_helper'

describe "wp_term_taxonomies/index" do
  before(:each) do
    assign(:wp_term_taxonomies, [
      stub_model(WpTermTaxonomy,
        :term_taxonomy_id => 1,
        :term_id => 2,
        :taxonomy => "Taxonomy",
        :description => "MyText",
        :parent => 3,
        :count => 4
      ),
      stub_model(WpTermTaxonomy,
        :term_taxonomy_id => 1,
        :term_id => 2,
        :taxonomy => "Taxonomy",
        :description => "MyText",
        :parent => 3,
        :count => 4
      )
    ])
  end

  it "renders a list of wp_term_taxonomies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Taxonomy".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
