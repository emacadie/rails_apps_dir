require "spec_helper"

describe WpLinksController do
  describe "routing" do

    it "routes to #index" do
      get("/wp_links").should route_to("wp_links#index")
    end

    it "routes to #new" do
      get("/wp_links/new").should route_to("wp_links#new")
    end

    it "routes to #show" do
      get("/wp_links/1").should route_to("wp_links#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wp_links/1/edit").should route_to("wp_links#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wp_links").should route_to("wp_links#create")
    end

    it "routes to #update" do
      put("/wp_links/1").should route_to("wp_links#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wp_links/1").should route_to("wp_links#destroy", :id => "1")
    end

  end
end
