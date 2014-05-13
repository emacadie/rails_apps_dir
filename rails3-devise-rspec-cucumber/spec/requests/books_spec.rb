require 'spec_helper'

describe "Books" do
  describe "GET /books" do
    xit "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      # dies because there are no books - 
      get books_path
      response.status.should be(200)
    end
  end
end
