require "spec_helper"

describe WpOptionsController do
  describe "routing" do

    it "routes to #index" do
      get("/wp_options").should route_to("wp_options#index")
    end

    it "routes to #new" do
      get("/wp_options/new").should route_to("wp_options#new")
    end

    it "routes to #show" do
      get("/wp_options/1").should route_to("wp_options#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wp_options/1/edit").should route_to("wp_options#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wp_options").should route_to("wp_options#create")
    end

    it "routes to #update" do
      put("/wp_options/1").should route_to("wp_options#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wp_options/1").should route_to("wp_options#destroy", :id => "1")
    end

  end
end
