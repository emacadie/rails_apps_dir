require 'spec_helper'
require 'game'
require 'game_helper'
require 'game_board'

# for best results: rspec -f d 

describe GameBoard do
  let(:game_board) { GameBoard.new }
    
  it "sets board elements to X" do
    for value in [0, 1, 2, 3, 4, 5, 6, 7, 8]
      game_board.make_user_move(value)
      game_board.get_space(value).should.eql?("X")
    end
  end
  
    it "sets board elements to X" do
    for value in [0, 1, 2, 3, 4, 5, 6, 7, 8]
        game_board.make_computer_move(value)
      game_board.get_space(value).should.eql?("O")
    end
  end
  
  it "does not allow duplicate entries in the game array" do
    game_board.make_user_move(2)
    game_board.get_space(2).should.eql?("X")
    game_board.space_available("3").should be_true
    game_board.make_user_move("3")
    game_board.get_space(3).should.eql?("X")
    game_board.space_available("3").should be_false
  end
  
end
