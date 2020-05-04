require "spec_helper"

describe WpUsersController do
  describe "routing" do

    it "routes to #index" do
      get("/wp_users").should route_to("wp_users#index")
    end

    it "routes to #new" do
      get("/wp_users/new").should route_to("wp_users#new")
    end

    it "routes to #show" do
      get("/wp_users/1").should route_to("wp_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wp_users/1/edit").should route_to("wp_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wp_users").should route_to("wp_users#create")
    end

    it "routes to #update" do
      put("/wp_users/1").should route_to("wp_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wp_users/1").should route_to("wp_users#destroy", :id => "1")
    end

  end
end
