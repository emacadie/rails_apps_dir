require 'spec_helper'

describe "wp_term_taxonomies/show" do
  before(:each) do
    @wp_term_taxonomy = assign(:wp_term_taxonomy, stub_model(WpTermTaxonomy,
      :term_taxonomy_id => 1,
      :term_id => 2,
      :taxonomy => "Taxonomy",
      :description => "MyText",
      :parent => 3,
      :count => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Taxonomy/)
    rendered.should match(/MyText/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
