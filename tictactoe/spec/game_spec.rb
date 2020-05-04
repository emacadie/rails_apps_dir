require 'spec_helper'
require 'game'
require 'game_helper'

# for best results: rspec -f d 

describe Game do
  let(:game) { Game.new }

  it "array of wins should contain 8 arrays at first" do
    return_array = game.x_array_of_wins
    return_array.size.should == 8
  end
  
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
  end

  it "sets game_board elements" do
    for value in [0, 1, 2, 3, 4, 5, 6, 7, 8]
      # puts "Here is value: " + value.to_s
      game.set_user_board=(value.to_s)
      # puts "Here is game.user_board[" + value.to_s + " ]: " + game.user_board[value].to_s
      game.user_board[value].should.eql?("X")
    end
  end
 
  it "does not allow duplicate entries in the main array" do
    game.set_user_board=("2")
    game.user_board[2].should == "X"
    game.set_user_board=("3")
    game.user_board[3].should == "X"
    GameHelper.space_available("3", game.user_board).should be_false
  end

  describe "literal corner cases" do
    it "handles corner cases" do
      for value in [0] #, 2, 6, 8]
          game.set_user_board=(value.to_s)
        game.make_move!(value.to_s)
        game.user_board[4].should == "O"
      end
    end
  end
  
  describe "handling the center" do
    it "selects a corner if user first move is to center" do
      game.set_user_board=("4")
      game.make_move!("4")
      # puts @game.game_board.to_s
      corner = false
      if game.user_board[0].eql?("O")
        corner = true
      end
      corner.should be_true
    end
  end

  it "tracks user history" do
    for value in [[0,6,5], [1,0,3]]
      the_game = Game.new
      value.each do |v|
        the_game.set_user_board=(v.to_s)
        the_game.make_move!(v.to_s)
      end
      the_game.user_history.eql?(value).should be_true
    end
  end
  
  it "tracks move number" do
    for value in [[0,6,5], [1,0,3]]
      the_game = Game.new
      value.each do |v|
        the_game.set_user_board=(v.to_s)
        the_game.make_move!(v.to_s)
      end
      handled_well = true
      handled_well if the_game.move_number == value.length
      handled_well.should be_true
    end
  end
  
  describe "handling edge openings" do 
    it "handles 1" do
      game.set_user_board=("1")
      game.make_move!("1")
      handled_well = false
      if game.user_board[4].eql?("O") 
        handled_well = true
      end
      handled_well.should be_true
    end
  end
 
  # to run just this test:
  # rspec -e "should reduce the array_of_wins for every move by computer"
  it "should reduce the array_of_wins for every move by computer" do
    first_size = game.x_array_of_wins.size
    puts "@game.x_array_of_wins: " + game.x_array_of_wins.to_s
    game.set_user_board=("4")
    game.make_move!("4")
    second_size = game.x_array_of_wins.size
    # puts "@game.x_array_of_wins: " + game.x_array_of_wins.to_s
    # puts "@game.user_board: " + game.user_board.to_s
    (first_size > second_size).should be_true
  end
 
  # describe "test blocking moves" do
  it "should stop along the top" do
    game.set_user_board=("0")
    game.make_move!("0")
    game.set_user_board=("1")
    game.make_move!("1")
    # puts "in test: @game.user_board: " + game.user_board.to_s
    # puts "---------------------"
    # puts "in test: game.find_array_to_block(game.create_used_array(game.x_array_of_wins, X))" + game.find_array_to_block(game.create_used_array(game.x_array_of_wins, "X"), "X").to_s
    # puts "in test: @game.x_array_of_wins: " + game.x_array_of_wins.to_s
    # puts "in test: @game.find_array_to_block: " + game.find_array_to_block(game.x_array_of_wins, "X").to_s
    # puts "in test: @game.user_board: " + game.user_board.to_s
    game.user_board[2].eql?("O").should be_true
  end
  
  describe "test for all possible combos" do
    it "tests all 0 moves" do
      test_num([0,1,2,3,5,6,7,8]) 
    end
    
    it "tests all 1 moves" do
      test_num([1,0,2,3,5,6,7,8]) 
    end

    it "tests all 2 moves" do
      test_num([2,0,1,3,5,6,7,8])
    end

    it "tests all 3 moves" do
      test_num([3,0,1,2,5,6,7,8])
    end
    
    it "tests all 4 moves" do
      test_num([4,1,2,3,5,6,7,8])
    end
    
    it "tests all 5 moves" do
      test_num([5,0,1,2,3,6,7,8])
    end
    
    it "tests all 6 moves" do
      test_num([6,0,1,2,3,5,7,8])
    end

    it "tests all 7 moves" do
      test_num([7,0,1,2,3,5,6,8])
    end
    
    it "tests all 8 moves" do
      test_num([8,0,1,2,3,5,6,7])
    end
    
    def test_num(array_of_numbers)
      array_of_moves = Array.new
      # take corner
      array_of_moves = create_table(array_of_numbers)
      
      total_arrays = array_of_moves.length
      counter = 0
      x_fail = 0
      array_of_moves.each do |aom|
        counter = counter + 1
        # puts "#### Testing " + aom.to_s
        the_game = Game.new
        aom.each do |num|
          # puts "++++ Testing " + num.to_s
          # the_game.print_board
          the_game.set_user_board=(num.to_s)
          the_game.make_move!(num.to_s)
          the_game.set_user_board=("4")

          if the_game.detect_win("O")
              break
          elsif the_game.detect_tie
              break
          elsif the_game.detect_win("X")
            puts "X wins with " + aom.to_s
            the_game.print_board
            puts "------------"
            puts "total_arrays: " + total_arrays.to_s
            puts "counter: " + counter.to_s
            puts "x_fail: " + x_fail.to_s
            x_fail = x_fail + 1
          end
          the_game.detect_win("X").should be_false
        end
        
        # puts "#### Done Testing " + aom.to_s
        # the_game.print_board
        the_game.detect_win("X").should be_false
      end
      puts "total_arrays: " + total_arrays.to_s
      puts "counter: " + counter.to_s
      puts "x_fail: " + x_fail.to_s
    end
    
  end
  
  describe "testing for wins" do
    it "detects a win by computer along the vertical middle with array" do
      for value in [0, 6, 2, 8]
        game.set_user_board=(value.to_s)
        game.make_move!(value.to_s)
        game.set_user_board=("4")
      end
      GameHelper.print_board(game.user_board)
      game.detect_win("O").should be_true
    end

  end
  
  it "should detect opposite corners" do
    corner_array = Array.new
    corner_array.push(["0", "8"])
    # corner_array.push(["8", "0"])
    # corner_array.push(["2", "6"])
    # corner_array.push(["6", "2"])
    corner_array.each do |ca|
      the_game = Game.new
      the_game.set_user_board=(ca[0])
      the_game.make_move!(ca[0])
      the_game.set_user_board=(ca[1])
      puts "in test: game.game_board: " + the_game.user_board.to_s
      the_game.x_has_first_two_corners.should be_true
    end
  end
  
  it "should detect if all edges blank" do
    edge_array = Array.new
    edge_array.push("1", "3", "5", "7")
    edge_array.each do |edge|
      the_game = Game.new
      the_game.all_edges_blank.should be_true
      the_game.set_user_board=(edge)
      the_game.make_move!(edge)
      the_game.all_edges_blank.should be_false
    end
    
  end

  def create_table(the_table)
    giant = Array.new
    zz = the_table

    zz.each do |b| # 1
      zz.each do |c| # 2
        zz.each do |d| # 3
          zz.each do |f| # 5
            zz.each do |g| # 6
              zz.each do |h| # 7
                zz.each do |i| # 8
                  ss = Array.new
                  ss.push(zz[0], b,c,d, f,g,h,i)
                  ss = ss.uniq
                  if ss.length == 5
                    giant.push(ss)
                  end
                end
              end
            end
          end
        end
      end
    end  
 
    giant.uniq!
    giant.sort!
    return giant
  end

end # line 476


