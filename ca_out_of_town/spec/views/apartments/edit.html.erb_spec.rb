require 'spec_helper'

describe "apartments/edit" do
  before(:each) do
    @apartment = assign(:apartment, stub_model(Apartment,
      :address_1 => "MyString",
      :address_2 => "MyString",
      :city => "MyString",
      :zip => "",
      :landlord_id => 1
    ))
  end

  it "renders the edit apartment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => apartments_path(@apartment), :method => "post" do
      assert_select "input#apartment_address_1", :name => "apartment[address_1]"
      assert_select "input#apartment_address_2", :name => "apartment[address_2]"
      assert_select "input#apartment_city", :name => "apartment[city]"
      assert_select "input#apartment_zip", :name => "apartment[zip]"
      assert_select "input#apartment_landlord_id", :name => "apartment[landlord_id]"
    end
  end
end
