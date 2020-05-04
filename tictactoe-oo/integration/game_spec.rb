require 'spec_helper'
require 'game'
require 'game_helper'
require 'game_board'

# for best results: rspec -format documentation ./integration

describe Game do

  num_arrays = Hash.new
  num_arrays[0] = [0,1,2,3,5,6,7,8]
  num_arrays[1] = [1,0,2,3,5,6,7,8]
  num_arrays[2] = [2,0,1,3,5,6,7,8]
  num_arrays[3] = [3,0,1,2,5,6,7,8]
  num_arrays[4] = [4,1,2,3,5,6,7,8]
  num_arrays[5] = [5,0,1,2,3,6,7,8]
  num_arrays[6] = [6,0,1,2,3,5,7,8]
  num_arrays[7] = [7,0,1,2,3,5,6,8]
  num_arrays[8] = [8,0,1,2,3,5,6,7]

# ---------------------------
  describe "test for all possible combos" do
    it "tests all 0 moves" do
      array_of_moves = create_table(num_arrays[0])
      test_num(array_of_moves, 0) 
      test_num(array_of_moves, 1) 
    end
    
    it "tests all 1 moves" do
      array_of_moves = create_table(num_arrays[1])
      test_num(array_of_moves, 0) 
      test_num(array_of_moves, 1)  
    end
    
    it "tests all 2 moves" do
      array_of_moves = create_table(num_arrays[2])
      test_num(array_of_moves, 0) 
      test_num(array_of_moves, 1) 
    end
    
    it "tests all 3 moves" do
      array_of_moves = create_table(num_arrays[3])
      test_num(array_of_moves, 0) 
      test_num(array_of_moves, 1) 
    end
    
    it "tests all 4 moves" do
      array_of_moves = create_table(num_arrays[4])
      test_num(array_of_moves, 0) 
      test_num(array_of_moves, 1) 
    end
    
    it "tests all 5 moves" do
      array_of_moves = create_table(num_arrays[5])
      test_num(array_of_moves, 0) 
      test_num(array_of_moves, 1) 
    end
    
    it "tests all 6 moves" do
      array_of_moves = create_table(num_arrays[6])
      test_num(array_of_moves, 0) 
      test_num(array_of_moves, 1) 
    end
    
    it "tests all 7 moves" do
      array_of_moves = create_table(num_arrays[7])
      test_num(array_of_moves, 0) 
      test_num(array_of_moves, 1) 
    end
    
    it "tests all 8 moves" do
      array_of_moves = create_table(num_arrays[8])
      test_num(array_of_moves, 0) 
      test_num(array_of_moves, 1) 
    end
    
    def test_num(array_of_moves, algo)
      array_of_moves = Array.new
      # take corner

      
      total_arrays = array_of_moves.length
      counter = 0
      x_fail = 0
      array_of_moves.each do |aom|
        counter = counter + 1
        # puts "#### Testing " + aom.to_s
        the_game = Game.new(algo)
        aom.each do |num|
          # puts "++++ Testing " + num.to_s

          if the_game.game_board.space_available(num.to_s)
            the_game.make_user_move(num.to_s)
            the_game.make_computer_move(the_game.plan_computer_move!(num.to_s))
            the_game.make_user_move("4")
          end
          if the_game.win_detector.detect_win("O", the_game.game_board)
              break
          elsif the_game.win_detector.detect_tie
              break
          elsif the_game.win_detector.detect_win("X", the_game.game_board)
            puts "X wins with " + aom.to_s
            GameHelper.print_board(the_game.game_board.send_board_to_formatter)
            puts "------------"
            puts "total_arrays: " + total_arrays.to_s + ", counter: " + counter.to_s + ", x_fail: " + x_fail.to_s
            x_fail = x_fail + 1
          end
          the_game.win_detector.detect_win("X", the_game.game_board).should be_false
        end
        
        # puts "#### Done Testing " + aom.to_s
        the_game.win_detector.detect_win("X", the_game.game_board).should be_false
      end
      puts "total_arrays: " + total_arrays.to_s + ", counter: " + counter.to_s + ", x_fail: " + x_fail.to_s +
        ",algo: " + algo.to_s
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
                  if ss.length == 6
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

