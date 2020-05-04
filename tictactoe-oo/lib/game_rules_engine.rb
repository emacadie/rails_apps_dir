require_relative 'game'
require_relative 'game_board'
require_relative 'game_helper'
require_relative 'game_algorithm'

class GameRulesEngine < GameAlgorithm

  attr_reader :x_array_of_wins
  attr_reader :o_array_of_wins
  attr_reader :move_4_hash
  attr_reader :game_board
  attr_reader :internal_move_num
  attr_reader :on_first_move
  attr_reader :first_move
  attr_reader :user_history
  
  def initialize(game_board)
    # super
    @x_array_of_wins = GameHelper.populate_array_of_wins
    @o_array_of_wins = GameHelper.populate_array_of_wins
    @move_4_hash = GameHelper.create_move_4_hash
    @game_board = game_board
    @internal_move_num = 1
    @on_first_move = true
    @user_history = []
  end

  def make_computer_move!(usr_input)
    @internal_move_num += 1    
    @user_history.push(usr_input.to_i)
    @o_array_of_wins = self.remove_from_array_of_wins(@o_array_of_wins, usr_input.to_i)
    if @on_first_move
      @first_move = usr_input.to_i
      the_move = self.make_first_move(usr_input)
      @on_first_move = false
    elsif @game_board.x_has_first_two_corners && @game_board.all_edges_blank
      the_move = 1
    else
      next_move = self.make_next_move 
      if next_move != nil && game_board.space_available(next_move.to_s)
        the_move = next_move
      end
    end
    @x_array_of_wins = self.remove_from_array_of_wins(@x_array_of_wins, the_move)
    return the_move
  end

  def make_next_move 
    if @first_move != 4
      move_array = self.make_move_array
    elsif @first_move == 4
      move_4 = self.find_move_4 
      if !move_4.nil?
        return move_4
      else
        move_array = self.make_move_array 
      end
    end

    move_array.each do |move|
      if !move.nil?
        return move
      end
    end
  end

  def make_first_move(usr_input)
    if usr_input.eql?("4") # they pick the center
      return 0
    else
      return 4
    end
  end

  def make_move_array 
    move_array = Array.new(0,3)
    if @internal_move_num <= 3
      move_array[2] = self.find_third_square(@o_array_of_wins, "O") 
      move_array[1] = self.find_third_square(@x_array_of_wins, "X") 
      move_array[0] = self.plot_next_move!
    else
      move_array[1] = self.find_third_square(@o_array_of_wins, "O") 
      move_array[0] = self.find_third_square(@x_array_of_wins, "X") 
      move_array[2] = self.plot_next_move!
    end
    return move_array
  end

  def plot_next_move!
    # this will count how many times an unused square is mentioned in the array of wins for X
    importance_array = Array.new(9, 0)
    self.create_used_array(@x_array_of_wins, "X").each do |c|
      c.each do |d|
        importance_array[d] += 1
      end
    end
    
    if @game_board.space_available(importance_array.rindex(importance_array.max).to_s)
      return importance_array.rindex(importance_array.max)
    else
      return nil
    end
  end

  # find winning x array for which there are already two spaces used
  def find_third_square(the_array_of_wins, player) 
    the_array = self.create_used_array(the_array_of_wins, player)
    return nil if the_array.length == 0
    count_array = [] 
    the_array.each do |x|
      used = 0
      x.each do |xx|
        used += 1 if @game_board.get_space(xx).eql?(player)
      end
      count_array.push(used)
    end
    num_to_use = nil
    the_array[count_array.index(count_array.max)].each do |x|
       num_to_use = x if @game_board.space_available(x.to_s)
    end
    return num_to_use
  end # line 216
 
  # take x/o_array_of_wins, and extract the ones that X/O has put a mark in
  def create_used_array(this_array, player)
    x_used = [] 
    this_array.each do |x|
      has_used_spaces = false
      x.each do |xx|
        if !@game_board.space_available(xx.to_s)
          has_used_spaces = true if @game_board.get_space(xx).eql?(player)
        end
        x_used.push(x) if has_used_spaces
      end
      x_used.uniq!
    end
    return x_used
  end

  def find_move_4 
    move_3 = nil
    @move_4_hash.each do |key, value|
      value.each do |v|
        move_3 = key if @user_history.eql?(v)
      end
    end
    return move_3
  end # line 165

  def remove_from_array_of_wins(first_array, cell_to_remove)
    return first_array.map{|b| b if b.index(cell_to_remove) == nil }.compact
  end

end
