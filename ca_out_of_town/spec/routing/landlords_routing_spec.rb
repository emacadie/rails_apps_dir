require "spec_helper"

describe LandlordsController do
  describe "routing" do

    it "routes to #index" do
      get("/landlords").should route_to("landlords#index")
    end

    it "routes to #new" do
      get("/landlords/new").should route_to("landlords#new")
    end

    it "routes to #show" do
      get("/landlords/1").should route_to("landlords#show", :id => "1")
    end

    it "routes to #edit" do
      get("/landlords/1/edit").should route_to("landlords#edit", :id => "1")
    end

    it "routes to #create" do
      post("/landlords").should route_to("landlords#create")
    end

    it "routes to #update" do
      put("/landlords/1").should route_to("landlords#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/landlords/1").should route_to("landlords#destroy", :id => "1")
    end

  end
end
