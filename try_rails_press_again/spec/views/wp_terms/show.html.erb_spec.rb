require 'spec_helper'

describe "wp_terms/show" do
  before(:each) do
    @wp_term = assign(:wp_term, stub_model(WpTerm,
      :term_id => 1,
      :name => "Name",
      :slug => "Slug",
      :term_group => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Slug/)
    rendered.should match(/2/)
  end
end
