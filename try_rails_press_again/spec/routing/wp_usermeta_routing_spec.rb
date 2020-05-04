require "spec_helper"

describe WpUsermetaController do
  describe "routing" do

    it "routes to #index" do
      get("/wp_usermeta").should route_to("wp_usermeta#index")
    end

    it "routes to #new" do
      get("/wp_usermeta/new").should route_to("wp_usermeta#new")
    end

    it "routes to #show" do
      get("/wp_usermeta/1").should route_to("wp_usermeta#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wp_usermeta/1/edit").should route_to("wp_usermeta#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wp_usermeta").should route_to("wp_usermeta#create")
    end

    it "routes to #update" do
      put("/wp_usermeta/1").should route_to("wp_usermeta#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wp_usermeta/1").should route_to("wp_usermeta#destroy", :id => "1")
    end

  end
end
