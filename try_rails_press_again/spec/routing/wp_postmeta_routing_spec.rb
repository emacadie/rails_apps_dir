require "spec_helper"

describe WpPostmetaController do
  describe "routing" do

    it "routes to #index" do
      get("/wp_postmeta").should route_to("wp_postmeta#index")
    end

    it "routes to #new" do
      get("/wp_postmeta/new").should route_to("wp_postmeta#new")
    end

    it "routes to #show" do
      get("/wp_postmeta/1").should route_to("wp_postmeta#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wp_postmeta/1/edit").should route_to("wp_postmeta#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wp_postmeta").should route_to("wp_postmeta#create")
    end

    it "routes to #update" do
      put("/wp_postmeta/1").should route_to("wp_postmeta#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wp_postmeta/1").should route_to("wp_postmeta#destroy", :id => "1")
    end

  end
end
