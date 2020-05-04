require "spec_helper"

describe WpCommentmetaController do
  describe "routing" do

    it "routes to #index" do
      get("/wp_commentmeta").should route_to("wp_commentmeta#index")
    end

    it "routes to #new" do
      get("/wp_commentmeta/new").should route_to("wp_commentmeta#new")
    end

    it "routes to #show" do
      get("/wp_commentmeta/1").should route_to("wp_commentmeta#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wp_commentmeta/1/edit").should route_to("wp_commentmeta#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wp_commentmeta").should route_to("wp_commentmeta#create")
    end

    it "routes to #update" do
      put("/wp_commentmeta/1").should route_to("wp_commentmeta#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wp_commentmeta/1").should route_to("wp_commentmeta#destroy", :id => "1")
    end

  end
end
