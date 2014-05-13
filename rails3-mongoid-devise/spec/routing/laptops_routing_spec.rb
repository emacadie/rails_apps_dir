require "spec_helper"

describe LaptopsController do
  describe "routing" do

    it "routes to #index" do
      get("/laptops").should route_to("laptops#index")
    end

    it "routes to #new" do
      get("/laptops/new").should route_to("laptops#new")
    end

    it "routes to #show" do
      get("/laptops/1").should route_to("laptops#show", :id => "1")
    end

    it "routes to #edit" do
      get("/laptops/1/edit").should route_to("laptops#edit", :id => "1")
    end

    it "routes to #create" do
      post("/laptops").should route_to("laptops#create")
    end

    it "routes to #update" do
      put("/laptops/1").should route_to("laptops#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/laptops/1").should route_to("laptops#destroy", :id => "1")
    end

  end
end
