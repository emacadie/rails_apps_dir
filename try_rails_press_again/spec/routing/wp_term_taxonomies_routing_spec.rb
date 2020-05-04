require "spec_helper"

describe WpTermTaxonomiesController do
  describe "routing" do

    it "routes to #index" do
      get("/wp_term_taxonomies").should route_to("wp_term_taxonomies#index")
    end

    it "routes to #new" do
      get("/wp_term_taxonomies/new").should route_to("wp_term_taxonomies#new")
    end

    it "routes to #show" do
      get("/wp_term_taxonomies/1").should route_to("wp_term_taxonomies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wp_term_taxonomies/1/edit").should route_to("wp_term_taxonomies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wp_term_taxonomies").should route_to("wp_term_taxonomies#create")
    end

    it "routes to #update" do
      put("/wp_term_taxonomies/1").should route_to("wp_term_taxonomies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wp_term_taxonomies/1").should route_to("wp_term_taxonomies#destroy", :id => "1")
    end

  end
end
