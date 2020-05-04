require "spec_helper"

describe WpTermsController do
  describe "routing" do

    it "routes to #index" do
      get("/wp_terms").should route_to("wp_terms#index")
    end

    it "routes to #new" do
      get("/wp_terms/new").should route_to("wp_terms#new")
    end

    it "routes to #show" do
      get("/wp_terms/1").should route_to("wp_terms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wp_terms/1/edit").should route_to("wp_terms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wp_terms").should route_to("wp_terms#create")
    end

    it "routes to #update" do
      put("/wp_terms/1").should route_to("wp_terms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wp_terms/1").should route_to("wp_terms#destroy", :id => "1")
    end

  end
end
