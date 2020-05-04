require "spec_helper"

describe WpPostsController do
  describe "routing" do

    it "routes to #index" do
      get("/wp_posts").should route_to("wp_posts#index")
    end

    it "routes to #new" do
      get("/wp_posts/new").should route_to("wp_posts#new")
    end

    it "routes to #show" do
      get("/wp_posts/1").should route_to("wp_posts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wp_posts/1/edit").should route_to("wp_posts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wp_posts").should route_to("wp_posts#create")
    end

    it "routes to #update" do
      put("/wp_posts/1").should route_to("wp_posts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wp_posts/1").should route_to("wp_posts#destroy", :id => "1")
    end

  end
end
