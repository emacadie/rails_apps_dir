# chapter 14 in RSpec book
require 'spec_helper'

describe Statement do

  it "uses the customer's name in the header" do
    # could call 'double', 'mock' or 'stub' here
    customer = stub('customer')
    customer.stub(:name).and_return('Aslak')
    statement = Statement.new(customer)
    statement.generate.should =~ /^Statement for Aslak/
  end

  it "logs a message on generate()" do
    customer = stub('customer')
    customer.stub(:name).and_return('Aslak')
    logger = mock('logger')
    statement = Statement.new(customer, logger)
    # we have no logger object, yet we can call the "log" method
    # it looks like I can call one or the other
    logger.should_receive(:log).with(/Statement generated for Aslak/)
    logger.should_receive(:go_insane_right_now).with('Going insane right now with Aslak')

    statement.generate
  end


end
