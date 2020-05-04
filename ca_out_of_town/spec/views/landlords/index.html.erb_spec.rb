require 'spec_helper'

describe "landlords/index" do
  before(:each) do
    assign(:landlords, [
      stub_model(Landlord,
        :first_name => "First Name",
        :second_name => "Second Name",
        :note => "MyText"
      ),
      stub_model(Landlord,
        :first_name => "First Name",
        :second_name => "Second Name",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of landlords" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Second Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
