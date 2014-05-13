require 'spec_helper'

# include Warden::Test::Helpers
describe UsersController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  def valid_session
    { 
      :user_id => @user.id
    }
  end 
  

  describe "GET 'show'" do
    
    it "should be successful" do
      get :show, :id => @user.id 
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user.id
      assigns(:user).should == @user
    end
    
  end

end
