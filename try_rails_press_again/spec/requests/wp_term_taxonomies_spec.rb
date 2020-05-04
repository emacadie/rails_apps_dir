require 'spec_helper'

describe "WpTermTaxonomies" do
  describe "GET /wp_term_taxonomies" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get wp_term_taxonomies_path
      response.status.should be(200)
    end
  end
end
