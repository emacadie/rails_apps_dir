require 'spec_helper'

describe "wp_terms/edit" do
  before(:each) do
    @wp_term = assign(:wp_term, stub_model(WpTerm,
      :term_id => 1,
      :name => "MyString",
      :slug => "MyString",
      :term_group => 1
    ))
  end

  it "renders the edit wp_term form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wp_term_path(@wp_term), "post" do
      assert_select "input#wp_term_term_id[name=?]", "wp_term[term_id]"
      assert_select "input#wp_term_name[name=?]", "wp_term[name]"
      assert_select "input#wp_term_slug[name=?]", "wp_term[slug]"
      assert_select "input#wp_term_term_group[name=?]", "wp_term[term_group]"
    end
  end
end
