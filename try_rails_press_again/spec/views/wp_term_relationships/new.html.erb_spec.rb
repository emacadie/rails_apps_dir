require 'spec_helper'

describe "wp_term_relationships/new" do
  before(:each) do
    assign(:wp_term_relationship, stub_model(WpTermRelationship,
      :object_id => 1,
      :term_taxonomy_id => 1,
      :term_order => 1
    ).as_new_record)
  end

  it "renders new wp_term_relationship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wp_term_relationships_path, "post" do
      assert_select "input#wp_term_relationship_object_id[name=?]", "wp_term_relationship[object_id]"
      assert_select "input#wp_term_relationship_term_taxonomy_id[name=?]", "wp_term_relationship[term_taxonomy_id]"
      assert_select "input#wp_term_relationship_term_order[name=?]", "wp_term_relationship[term_order]"
    end
  end
end
