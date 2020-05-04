require 'spec_helper'

describe "apartments/show" do
  before(:each) do
    @apartment = assign(:apartment, stub_model(Apartment,
      :address_1 => "Address 1",
      :address_2 => "Address 2",
      :city => "City",
      :zip => "",
      :landlord_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address 1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address 2/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/City/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
