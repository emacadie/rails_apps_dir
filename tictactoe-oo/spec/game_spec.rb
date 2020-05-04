require 'spec_helper'
require 'game'
require 'game_helper'
require 'game_board'

# for best results: rspec -format documentation 

describe Game do
  let(:game) { Game.new }
  
  describe "test the inputs" do

    it "only sends numbers or 'Q' to the input function" do
      game.input_is_num_or_q("5").should be_true
    end

    it "accepts numbers between 0 and 8" do
      9.times do |num|
        game.input_is_num_or_q(num.to_s).should be_true
      end
    end

    it "should not accept numbers above 8" do
      9.upto(20) do |num|
        game.input_is_num_or_q(num.to_s).should be_false
      end
    end

    it "should not accept numbers below 0" do
      -9.upto(-1) do |num|
        game.input_is_num_or_q(num.to_s).should be_false
      end
    end

    it "accepts upper-case 'Q'" do
      game.input_is_num_or_q("Q").should be_true
    end

    it "rejects other letters" do
      for value in ["a", "A", "q", "b", "B"]
        game.input_is_num_or_q(value.to_s).should be_false
      end
    end
  end # describe "test the inputs" do

  it "sets game_board elements" do
    for value in [0, 1, 2, 3, 4, 5, 6, 7, 8]
      game.make_user_move(value.to_s)
      game.game_board.get_space(value).should.eql?("X")
    end
  end
 
  it "does not allow duplicate entries in the main array" do
    game.game_board.space_available("3").should be_true
    game.make_user_move("2")
    game.game_board.get_space(2).should == "X"
    game.game_board.space_available("2").should be_false
    game.game_board.space_available("3").should be_true
    game.make_user_move("3")
    game.game_board.get_space(3).should == "X"
    game.game_board.space_available("3").should be_false
  end
    
  # end

end # line 476

