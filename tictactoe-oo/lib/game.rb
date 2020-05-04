require_relative 'game_helper'
require_relative 'game_board'
require_relative 'game_rules_engine'
require_relative 'win_detector'

class Game
  #> - allow for a human player to play against a computer-controlled player.
  #> - the computer player must win whenever possible, and should never lose.
  attr_accessor :input
  attr_reader :game_board
  attr_reader :win_detector
  attr_reader :game_algo
  
  def initialize(algo_num=0)
    @game_board = GameBoard.new
    @win_detector = WinDetector.new
    @game_algo = GameHelper.get_algo( algo_num, @game_board)
  end

  def get_input
    continue = true
    
    while continue == true
      GameHelper.print_board(@game_board.send_board_to_formatter)
      GameHelper.ask_for_input
      @input = gets
      @input = @input.chomp!
      if !input_is_num_or_q(@input)
        puts "You must enter a number from 0 to 8 to select a position, or 'Q' to quit"
      elsif @input.eql?("Q")
        puts "setting continue to false"
        continue = false
      else
        if @game_board.space_available(@input)
          self.make_user_move(@input)
          if @win_detector.detect_win("X", @game_board)
            puts GameHelper.print_board(@game_board.send_board_to_formatter).to_s + "You have done the impossible. Now you are a Jedi. GAME OVER"
            break
          end
          
          self.make_computer_move(self.plan_computer_move!(@input))
        else
          puts "That space is taken. Pick another"
        end
        continue = is_game_over
      end
    end
    puts "Thanks for playing"
  end
  
  def input_is_num_or_q(the_input)
    input_is_num(the_input) || the_input.eql?("Q")
  end
  
  def input_is_num(the_input)
    (the_input =~ /\d/) && ( 0 <= the_input.to_i && the_input.to_i <= 8 )
  end

  def make_user_move(usr_input)
    if input_is_num(usr_input) && @game_board.space_available(usr_input)
      @game_board.make_user_move(usr_input.to_i)
      @win_detector.remove_from_o_array(usr_input.to_i)
    end
  end

  # this just calls the algorithm class to see what the move
  # should be. It does not actually change the board
  def plan_computer_move!(usr_input)
    the_move = @game_algo.make_computer_move!(usr_input) 
    return the_move
  end

  def make_computer_move(the_number)
    @game_board.make_computer_move(the_number)
    @win_detector.remove_from_x_array(the_number)
  end
  
  def is_game_over
    if @win_detector.detect_win("O", @game_board)
      puts GameHelper.print_board(@game_board.send_board_to_formatter).to_s + "Computer wins. GAME OVER"
      return false
    elsif @win_detector.detect_win("X", @game_board)
      puts GameHelper.print_board(@game_board.send_board_to_formatter).to_s + "You have done the impossible. Now you are a Jedi. GAME OVER"
      return false
    elsif @win_detector.detect_tie
      puts GameHelper.print_board(@game_board.send_board_to_formatter).to_s + "No wins possible for you. GAME OVER"
      return false
    end
    return true
  end

end # 401

