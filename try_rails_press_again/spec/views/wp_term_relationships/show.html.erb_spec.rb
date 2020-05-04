require 'spec_helper'

describe "wp_term_relationships/show" do
  before(:each) do
    @wp_term_relationship = assign(:wp_term_relationship, stub_model(WpTermRelationship,
      :object_id => 1,
      :term_taxonomy_id => 2,
      :term_order => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
