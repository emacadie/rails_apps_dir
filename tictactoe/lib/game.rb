require_relative 'game_helper'

class Game
  #> - allow for a human player to play against a computer-controlled player.
  #> - the computer player must win whenever possible, and should never lose.
  attr_reader :x_array_of_wins
  attr_reader :o_array_of_wins
  attr_accessor :input
  attr_reader :on_first_move
  attr_reader :move_number
  attr_reader :user_board
  attr_reader :testing
  attr_reader :first_move
  attr_reader :user_history
  attr_reader :move_4_hash
  
  def initialize
    @user_history = Array.new
    @user_board = Array.new(9, "_")
    @x_array_of_wins = GameHelper.populate_array_of_wins
    @o_array_of_wins = GameHelper.populate_array_of_wins
    @move_4_hash = GameHelper.create_move_4_hash
    @on_first_move = true
    @move_number = 1
  end

  def get_input
    continue = true
    
    while continue == true
      GameHelper.print_board(@user_board)
      puts "Move number: " + @move_number.to_s
      
      GameHelper.ask_for_input
      @input = gets
      @input = @input.chomp!
      if !input_is_num_or_q(@input)
        puts "You must enter a number from 0 to 8 to select a position, or 'Q' to quit"
      elsif @input.eql?("Q")
        continue = false
      else
        if GameHelper.space_available(@input, @user_board)
          self.set_user_board=(@input)
          if detect_win("X")
            puts GameHelper.print_board(@user_board).to_s + "You have done the impossible. Now you are a Jedi. GAME OVER"
            break
          end
          self.make_move!(@input)
        else
          puts "That space is taken. Pick another"
        end
        continue = is_game_over
      end
      
    end
    puts "Thanks for playing"
  end
  
  def detect_tie
    # @x_array_of_wins.length == 0
    @user_board.index("_").nil?
  end
  
  def input_is_num_or_q(the_input)
    input_is_num(the_input) || the_input.eql?("Q")
  end
  
  def input_is_num(the_input)
    (the_input =~ /\d/) && ( 0 <= the_input.to_i && the_input.to_i <= 8 )
  end

  def set_user_board=(the_input)
    if input_is_num(the_input) && GameHelper.space_available(the_input, @user_board) 
      @move_number += 1
      @user_history.push(the_input.to_i)
      @user_board[the_input.to_i] = "X"
      @o_array_of_wins = remove_from_array_of_wins(@o_array_of_wins, the_input.to_i)
    end
  end

  def make_move!(usr_input)
    if @on_first_move
      @first_move = usr_input.to_i
      make_first_move(usr_input)
      @on_first_move = false
    elsif x_has_first_two_corners && all_edges_blank
      next_move = 1
      perform_actual_move(next_move)
    else
      if @first_move != 4 
        if @move_number <= 3
          move_3 = find_array_to_block(self.create_used_array(@o_array_of_wins, "O"), "O")
          move_2 = find_array_to_block(self.create_used_array(@x_array_of_wins, "X"), "X")
          move_1 = plot_next_move!
        else
          move_2 = find_array_to_block(self.create_used_array(@o_array_of_wins, "O"), "O")
          move_1 = find_array_to_block(self.create_used_array(@x_array_of_wins, "X"), "X")
          move_3 = plot_next_move!
        end
      elsif @first_move == 4
        move_3 = find_4_move
        if move_3.nil?    
          if @move_number < 3
            move_1 = find_array_to_block(self.create_used_array(@o_array_of_wins, "O"), "O")
            move_2 = find_array_to_block(self.create_used_array(@x_array_of_wins, "X"), "X")
            move_3 = plot_next_move!
          else
            move_2 = find_array_to_block(self.create_used_array(@o_array_of_wins, "O"), "O")
            move_1 = find_array_to_block(self.create_used_array(@x_array_of_wins, "X"), "X")
            move_3 = plot_next_move!
          end
        end
      end

      if !move_1.nil?
        next_move = move_1
      elsif !move_2.nil?
        next_move = move_2
      else
        next_move = move_3
      end
      if next_move != nil && GameHelper.space_available(next_move.to_s, @user_board)
        perform_actual_move(next_move)
      end
    end
  end
  
  def find_4_move
    the_move = nil
    @move_4_hash.each do |key, value|
      value.each do |v|
        the_move = key if @user_history.eql?(v)
      end
    end
    the_move
  end
  
  def make_first_move(usr_input)
    if usr_input.eql?("4") # they pick the center
      the_number = 0
    else
      the_number = 4
    end
    perform_actual_move(the_number)
  end
  
  def perform_actual_move(the_number)
    @user_board[the_number] = "O"
    @x_array_of_wins = remove_from_array_of_wins(@x_array_of_wins, the_number)
  end
  
  def remove_from_array_of_wins(first_array, cell_to_remove)
    first_array.map{|b| b if b.index(cell_to_remove) == nil }.compact
  end
  
  # take x/o_array_of_wins, and extract the ones that X/O has put a mark in
  def create_used_array(this_array, player)
    x_used = Array.new
    this_array.each do |x|
      has_used_spaces = false
      x.each do |xx|
        if !GameHelper.space_available(xx.to_s, @user_board)
          has_used_spaces = true if @user_board[xx].eql?(player)
        end
        x_used.push(x) if has_used_spaces
      end
      x_used.uniq!
    end
    x_used
  end
  
  def plot_next_move!
    # this will count how many times an unused square is mentioned in the array of wins for X
    importance_array = Array.new(9, 0)
    self.create_used_array(@x_array_of_wins, "X").each do |c|
      c.each do |d|
        importance_array[d] += 1
      end
    end
    
    if GameHelper.space_available(importance_array.index(importance_array.max).to_s, @user_board)
      return importance_array.index(importance_array.max)
    elsif GameHelper.space_available(importance_array.rindex(importance_array.max).to_s, @user_board)
      return importance_array.rindex(importance_array.max)
    else
      return nil
    end
  end
  
  # find winning x array for which there are already two spaces used
  def find_array_to_block(the_array, player)
    return nil if the_array.length == 0
    count_array = Array.new
    the_array.each do |x|
      used = 0
      x.each do |xx|
        used += 1 if @user_board[xx].eql?(player) 
      end
      count_array.push(used)
    end
    num_to_use = nil
    the_array[count_array.index(count_array.max)].each do |x|
       num_to_use = x if GameHelper.space_available(x.to_s, @user_board)
    end
    num_to_use
  end # line 216

  def detect_win(player)
    if player.eql?("O")
      array_of_wins = @o_array_of_wins
    else
      array_of_wins = @x_array_of_wins
    end
    return false if array_of_wins.length == 0
    array_of_wins.each do |x|
      return true if @user_board[x[0]].eql?(player) && @user_board[x[1]].eql?(player) && @user_board[x[2]].eql?(player)
    end
    return false
  end

  def is_game_over
    if detect_win("O")
      puts GameHelper.print_board(@user_board).to_s + "Computer wins. GAME OVER"
      return false
    elsif detect_win("X")
      puts GameHelper.print_board(@user_board).to_s + "You have done the impossible. Now you are a Jedi. GAME OVER"
      return false
    elsif detect_tie
      puts GameHelper.print_board(@user_board).to_s + "No wins possible for you. GAME OVER"
      return false
    end
    return true
  end
  
  def x_has_first_two_corners
    return true if @user_board[0].eql?("X") && @user_board[8].eql?("X") && @user_board[2].eql?("_") && @user_board[6].eql?("_")
    return true if @user_board[2].eql?("X") && @user_board[6].eql?("X") && @user_board[0].eql?("_") && @user_board[0].eql?("_")
  end
  
  def all_edges_blank
    GameHelper.space_available("1", @user_board) && 
        GameHelper.space_available("3", @user_board) && 
        GameHelper.space_available("5", @user_board) && 
        GameHelper.space_available("7", @user_board)
  end
  
end # 401

