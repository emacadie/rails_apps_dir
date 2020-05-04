require 'spec_helper'

describe "apartments/index" do
  before(:each) do
    assign(:apartments, [
      stub_model(Apartment,
        :address_1 => "Address 1",
        :address_2 => "Address 2",
        :city => "City",
        :zip => "",
        :landlord_id => 1
      ),
      stub_model(Apartment,
        :address_1 => "Address 1",
        :address_2 => "Address 2",
        :city => "City",
        :zip => "",
        :landlord_id => 1
      )
    ])
  end

  it "renders a list of apartments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address 1".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address 2".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
