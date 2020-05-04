require 'spec_helper'

describe "landlords/show" do
  before(:each) do
    @landlord = assign(:landlord, stub_model(Landlord,
      :first_name => "First Name",
      :second_name => "Second Name",
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Second Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
