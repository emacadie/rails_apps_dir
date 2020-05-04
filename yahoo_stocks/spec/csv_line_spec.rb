require 'spec_helper'
require 'csv_line'

describe CsvLine do
  # Description,1-Day Price Chg %,Market Cap,P/E,ROE %,Div. Yield %,Debt to Equity,Price to Book,Net Profit Margin (mrq),Price To Free Cash Flow (mrq)
  first_line  = '"API Technologies Corp.",0.340,159.91M,"NA","NA","NA",91.558,0.904,-138.781,26.911'
  second_line = '"Applied Micro Circuits","NA","NA","NA",-48.064,"NA","NA","NA",-56.643,"NA"'
  third_line  = '"ARM Holdings PLC",2.050,10.28B,46.688,13.566,"NA",0.337,5.827,29.077,"NA"'

  it "does something simple" do
    input_line = "four score and seven years ago"
    c_line = CsvLine.new(input_line)
    c_line.the_line.should == input_line
  end

  it "checks the first line" do
    puts "Here is first_line: #{first_line}"
    c_line = CsvLine.new(first_line)
    c_line.one_day_price_chg.should == "0.340"
    c_line.description.should == "API Technologies Corp."
  end

  it "should declare a line invalid with too many 'NA' values" do
    c_line = CsvLine.new(second_line)
    c_line.valid_line.should == false
  end

  it "should ask 'why make billions when we can make millions'" do
    mill = CsvLine.new(first_line)
    mill.market_cap.should == "159_910_000"
    puts "Here is the line:"
    puts mill.print_line
    # first_line  = '"API Technologies Corp.",0.340,159.91M,"NA","NA","NA",91.558,0.904,-138.781,26.911'
  # second_line = '"Applied Micro Circuits","NA","NA","NA",-48.064,"NA","NA","NA",-56.643,"NA"'
  # third_line  = '"ARM Holdings PLC",2.050,10.28B,46.688,13.566,"NA",0.337,5.827,29.077,"NA"'

  end

end
