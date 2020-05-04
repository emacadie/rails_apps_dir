require 'spec_helper'

describe Customer do
  it "creates a customer" do
    cust = Customer.new("John")
    cust.name.should == "John"
  end
end
