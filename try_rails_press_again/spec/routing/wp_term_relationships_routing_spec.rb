require "spec_helper"

describe WpTermRelationshipsController do
  describe "routing" do

    it "routes to #index" do
      get("/wp_term_relationships").should route_to("wp_term_relationships#index")
    end

    it "routes to #new" do
      get("/wp_term_relationships/new").should route_to("wp_term_relationships#new")
    end

    it "routes to #show" do
      get("/wp_term_relationships/1").should route_to("wp_term_relationships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wp_term_relationships/1/edit").should route_to("wp_term_relationships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wp_term_relationships").should route_to("wp_term_relationships#create")
    end

    it "routes to #update" do
      put("/wp_term_relationships/1").should route_to("wp_term_relationships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wp_term_relationships/1").should route_to("wp_term_relationships#destroy", :id => "1")
    end

  end
end
