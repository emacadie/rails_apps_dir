require 'spec_helper'
require 'game'
require 'game_helper'
require 'game_board'

# for best results: rspec -format documentation 

describe Game do
  let(:game) { Game.new(1) }
  let(:algo) {game.game_algo}

  it "array of wins should contain 8 arrays at first" do
    return_array = algo.x_array_of_wins 
    return_array.size.should == 8
  end

  describe "literal corner cases" do
    it "handles corner cases" do
      for value in [0, 2, 6, 8]
        game.make_user_move(value.to_s)
        game.make_computer_move(game.plan_computer_move!(value.to_s))
        game.game_board.get_space(4).should.eql?("O")
      end
    end
  end
  
  describe "handling the center" do
    it "selects a corner if user first move is to center" do
      game.make_user_move("4")
      game.make_computer_move(game.plan_computer_move!("4"))
      corner = false
      if game.game_board.get_space(0).eql?("O")
        corner = true
      end
      corner.should be_true
    end
  end

  it "algo tracks user history" do
    for value in [[0,6,5], [1,0,3]]
      the_game = Game.new
      value.each do |v|
        the_game.make_user_move(v.to_s)
        the_game.make_computer_move(the_game.plan_computer_move!(v.to_s))
      end
      the_game.game_algo.user_history.eql?(value).should be_true
    end
  end
  
  it "tracks move number" do
    for value in [[0,6,5], [1,0,3]]
      the_game = Game.new
      value.each do |v|
        the_game.make_user_move(v.to_s)
        the_game.make_computer_move(the_game.plan_computer_move!(v.to_s))
      end
      handled_well = true
      handled_well if the_game.game_algo.internal_move_num == value.length
      handled_well.should be_true
    end
  end
  
  describe "handling edge openings" do 
    it "handles 1" do
      game.make_user_move("1")
      game.make_computer_move(game.plan_computer_move!("1"))
      handled_well = false
      if game.game_board.get_space(4).eql?("O") 
        handled_well = true
      end
      handled_well.should be_true
    end
  end
 
  # to run just this test:
  # rspec -e "should reduce the array_of_wins for every move by computer"
  it "should reduce the array_of_wins for every move by computer" do
    first_size = algo.x_array_of_wins.size
    puts "@game.x_array_of_wins: " + game.game_algo.x_array_of_wins.to_s
    game.make_user_move("4")
    game.make_computer_move(game.plan_computer_move!("4"))
    second_size = algo.x_array_of_wins.size
    GameHelper.print_board(game.game_board.send_board_to_formatter)
    (first_size > second_size).should be_true
  end
 
  # describe "test blocking moves" do
  it "should stop along the top" do
    game.make_user_move("0")
    game.make_computer_move(game.plan_computer_move!("0"))
    game.make_user_move("1")
    game.make_computer_move(game.plan_computer_move!("1"))
GameHelper.print_board(game.game_board.send_board_to_formatter)
    game.game_board.get_space(2).eql?("O").should be_true
  end

  describe "testing for wins" do
    it "detects a win by computer along the vertical middle with array" do
      for value in [0, 6, 2, 8]
        game.make_user_move(value.to_s)
        game.make_computer_move(game.plan_computer_move!(value.to_s))
        game.make_user_move("4")
      end
      game.win_detector.detect_win("O", game.game_board).should be_true
    end

  end
  
  it "should detect opposite corners" do
    corner_array = Array.new
    corner_array.push(["0", "8"])
    corner_array.push(["8", "0"])
    corner_array.push(["2", "6"])
    corner_array.push(["6", "2"])
    corner_array.each do |ca|
      the_game = Game.new
      the_game.make_user_move(ca[0])
      the_game.make_computer_move(the_game.plan_computer_move!(ca[0]))
      the_game.make_user_move(ca[1])
      the_game.game_board.x_has_first_two_corners.should be_true
    end
  end
  
  it "should detect if all edges blank" do
    edge_array = Array.new
    edge_array.push("1", "3", "5", "7")
    edge_array.each do |edge|
      the_game = Game.new
      the_game.game_board.all_edges_blank.should be_true
      the_game.make_user_move(edge)
      the_game.make_computer_move(the_game.plan_computer_move!(edge))
      the_game.game_board.all_edges_blank.should be_false
    end
    
  end

end # line 476

