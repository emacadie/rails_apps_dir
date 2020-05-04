require 'spec_helper'
require 'game'
require 'game_helper'
require 'game_board'
require 'win_detector'

# for best results: rspec -format documentation 

describe WinDetector do
  let(:win_detector) { WinDetector.new }

  it "both arrays of wins should contain 8 arrays at first" do
    return_array = win_detector.x_array_of_wins
    return_array.size.should == 8
    return_array2 = win_detector.o_array_of_wins
    return_array2.size.should == 8
  end

  it "should reduce the array size by 3 when you send 0" do
    x_first = win_detector.x_array_of_wins.size
    o_first = win_detector.o_array_of_wins.size
    win_detector.remove_from_x_array(0)
    win_detector.remove_from_o_array(0)
    x_second = win_detector.x_array_of_wins.size
    o_second = win_detector.o_array_of_wins.size
    x_first.should == 8
    x_second.should == 5
    o_first.should == 8
    o_second.should == 5
  end

  it "should only change x if you call x and leave o alone" do
    x_first = win_detector.x_array_of_wins.size
    o_first = win_detector.o_array_of_wins.size
    win_detector.remove_from_x_array(0)
    x_second = win_detector.x_array_of_wins.size
    o_second = win_detector.o_array_of_wins.size
    x_first.should == 8
    x_second.should == 5
    o_first.should == 8
    o_second.should == 8
  end

  it "should only change o if you call o and leave x alone" do
    x_first = win_detector.x_array_of_wins.size
    o_first = win_detector.o_array_of_wins.size
    win_detector.remove_from_o_array(0)
    x_second = win_detector.x_array_of_wins.size
    o_second = win_detector.o_array_of_wins.size
    x_first.should == 8
    x_second.should == 8
    o_first.should == 8
    o_second.should == 5
  end
     
  # to run just this test:
  # rspec -e "should reduce the array_of_wins for every move by computer"
end # line 476

