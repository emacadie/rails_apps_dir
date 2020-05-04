require_relative 'game_rules_engine'
require_relative 'game_other_way'

class GameHelper
    
  def initialize
  end

  def self.get_algo(algo_num, game_board)
    if algo_num == 0
      return GameRulesEngine.new(game_board)
    elsif algo_num == 1
      return GameOtherWay.new(game_board)
    end
  end

  def self.print_board(user_board)
    puts "------------------"
    puts "Here is the board: "
    puts "0: " + user_board[0] + " 1: " + user_board[1] + " 2: " + user_board[2]
    puts "3: " + user_board[3] + " 4: " + user_board[4] + " 5: " + user_board[5]
    puts "6: " + user_board[6] + " 7: " + user_board[7] + " 8: " + user_board[8]
  end
  
  def self.populate_array_of_wins
      array_of_wins = Array.new
      array_of_wins.push([0,1,2])
      array_of_wins.push([3,4,5])
      array_of_wins.push([6,7,8])
      array_of_wins.push([0,3,6])
      array_of_wins.push([1,4,7])
      array_of_wins.push([2,5,8])
      array_of_wins.push([0,4,8])
      array_of_wins.push([2,4,6])
      
      return array_of_wins
    end
  
  def self.create_move_4_hash
    da_hash = Hash.new
    da_hash[6] = [[4, 5, 2], [4, 1, 5, 2], [4, 5, 7], [4, 8], [4, 5, 1, 2]]
    da_hash[2] = [[4, 5, 6], [4, 7, 5], [4, 7, 6], [4, 3, 7, 6], [4, 5, 3, 6], [4, 7, 1, 6], [4, 7, 3, 6]]
    da_hash[3] = [[4, 1, 5]]
    da_hash[1] = [[4, 5, 6, 7], [4, 6, 7], [4, 6, 5, 7]]
    return da_hash
  end
  
  def self.ask_for_input
    puts "Select a square by entering the number, or hit 'Q' to quit"
    puts "Enter your selection here: "
  end
  
end

