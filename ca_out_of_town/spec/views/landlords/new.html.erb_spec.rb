require 'spec_helper'

describe "landlords/new" do
  before(:each) do
    assign(:landlord, stub_model(Landlord,
      :first_name => "MyString",
      :second_name => "MyString",
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new landlord form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => landlords_path, :method => "post" do
      assert_select "input#landlord_first_name", :name => "landlord[first_name]"
      assert_select "input#landlord_second_name", :name => "landlord[second_name]"
      assert_select "textarea#landlord_note", :name => "landlord[note]"
    end
  end
end
