require "spec_helper"

describe WpCommentsController do
  describe "routing" do

    it "routes to #index" do
      get("/wp_comments").should route_to("wp_comments#index")
    end

    it "routes to #new" do
      get("/wp_comments/new").should route_to("wp_comments#new")
    end

    it "routes to #show" do
      get("/wp_comments/1").should route_to("wp_comments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wp_comments/1/edit").should route_to("wp_comments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wp_comments").should route_to("wp_comments#create")
    end

    it "routes to #update" do
      put("/wp_comments/1").should route_to("wp_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wp_comments/1").should route_to("wp_comments#destroy", :id => "1")
    end

  end
end
