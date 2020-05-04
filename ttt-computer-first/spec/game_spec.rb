require 'spec_helper'
require 'game'

# for best results: rspec -f d 

describe Game do
  let(:game) { Game.new }

  it "array of wins should contain 8 arrays at first" do
    return_array = game.x_array_of_wins
    return_array.size.should == 8
  end

  it "prints stuff" do
    # output = @game.get_input
    # puts output
  end

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

  it "sets continue to false if input is 'Q'" do
    # unknown how to test this
  end
  
  it "sets game_board elements" do
    game.set_game_board=("3")
    # puts "Here is @game.game_board[3]: " + @game.game_board[3].to_s
    game.game_board[3].should == "X" 
  end
  
  it "does not allow duplicate entries in the main array" do
    game.set_game_board=("2")
    game.game_board[2].should == "X"
    game.set_game_board=("3")
    game.game_board[3].should == "X"
    game.is_space_available("3").should be_false
  end

  describe "literal corner cases" do
    it "handles corner cases" do
      for value in [0, 2, 6, 8]
        game.set_game_board=(value.to_s)
        game.make_move(value.to_s)
        game.game_board[4].should == "O"
      end
    end
    
    it "puts 'O' in the center if you pick corner 0" do
      game.set_game_board=("0")
      game.make_move("0")
      game.game_board[4].should == "O"
    end
    
    it "puts 'O' in the center if you pick corner 2" do
      game.set_game_board=("2")
      game.make_move("2")
      game.game_board[4].should == "O"
    end
    
    it "puts 'O' in the center if you pick corner 6" do
      game.set_game_board=("6")
      game.make_move("6")
      game.game_board[4].should == "O"
    end
    
    it "puts 'O' in the center if you pick corner 8" do
      game.set_game_board=("2")
      game.make_move("8")
      game.game_board[4].should == "O"
    end
    
  end
  
  describe "handling the center" do
    it "selects a corner if user first move is to center" do
      game.set_game_board=("4")
      game.make_move("4")
      # puts @game.game_board.to_s
      corner = false
      if game.game_board[0] =~ /O/ || game.game_board[2] =~ /O/ ||
        game.game_board[6] =~ /O/ || game.game_board[8] =~ /O/ 
        corner = true
      end
      corner.should be_true
      # game.game_board[0].should == "O" || game.game_board[2].should == "O" || game.game_board[6].should == "O" || game.game_board[8].should == "O"
      # (game.game_board[0] || game.game_board[2] || game.game_board[6] || game.game_board[8]).should == "O"
    end
  end
  
  describe "handling edge openings" do 
    it "handles 1" do
      game.set_game_board=("1")
      game.make_move("1")
      handled_well = false
      if game.game_board[0] =~ /O/ || game.game_board[2] =~ /O/ || game.game_board[4] =~ /O/ || game.game_board[7] =~ /O/
        handled_well = true
      end
      handled_well.should be_true
    end
      
    it "handles 3" do
      game.set_game_board=("3")
      game.make_move("3")
      handled_well = false
      if game.game_board[0] =~ /O/ || game.game_board[4] =~ /O/ || game.game_board[5] =~ /O/ || game.game_board[6] =~ /O/
        handled_well = true
      end
      handled_well.should be_true
    end
      
    it "handles 5" do
      game.set_game_board=("5")
      game.make_move("5")
      handled_well = false
      if game.game_board[2] =~ /O/ || game.game_board[3] =~ /O/ || game.game_board[4] =~ /O/ || game.game_board[8] =~ /O/
        handled_well = true
      end
      handled_well.should be_true
    end
      
    it "handles 7" do
      game.set_game_board=("7")
      game.make_move("7")
      handled_well = false
      if game.game_board[1] =~ /O/ || game.game_board[4] =~ /O/ || game.game_board[6] =~ /O/ || game.game_board[8] =~ /O/
        handled_well = true
      end
      handled_well.should be_true
    end
  end
  
  # to run just this test:
  # rspec -e "should reduce the array_of_wins for every move by computer"
  it "should reduce the array_of_wins for every move by computer" do
    first_size = game.x_array_of_wins.size
    puts "game.x_array_of_wins: " + game.x_array_of_wins.to_s
    game.set_game_board=("4")
    game.make_move("4")
    second_size = game.x_array_of_wins.size
    puts "game.x_array_of_wins: " + game.x_array_of_wins.to_s
    puts "game.game_board: " + game.game_board.to_s
    (first_size > second_size).should be_true
  end
  
  # describe "test blocking moves" do
  it "should stop along the top" do
    game.set_game_board=("0")
    game.make_move("0")
    game.set_game_board=("1")
    game.make_move("1")
    puts "in test: game.game_board: " + game.game_board.to_s
    puts "---------------------"
    puts "in test: game.x_array_of_wins: " + game.x_array_of_wins.to_s
    puts "in test: game.find_array_to_block: " + game.find_x_array_to_block!.to_s
    puts "in test: game.game_board: " + game.game_board.to_s
      
  end
  # end
  
  describe "testing for wins" do
    it "detects a win by computer along the vertical middle with array" do
      for value in [0, 6, 2, 8]
        game.set_game_board=(value.to_s)
        game.make_move(value.to_s)
      end
      game.print_board
      game.detect_win("O").should be_true
    end
    it "detects a tie" do
      for value in [2,7,6]
        game.set_game_board=(value.to_s)
        game.make_move(value.to_s)
      end
      game.print_board
      game.detect_win("O").should be_false
    end
  end

=begin
  it "creates an array with nine elements" do
    game_board = @game.game_board
    puts "here is game_board: " + game_board.to_s
    puts "that was game_board. It is a " 
    puts game_board.class
    puts "here is game_board.size: " + game_board.size.to_s
    game_board.size should == 9
    # @game.game_board.size should == 9
  end
=end
end

