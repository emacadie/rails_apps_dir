require_relative 'game_helper'
require_relative 'game_board'

class WinDetector

  attr_reader :x_array_of_wins
  attr_reader :o_array_of_wins

  def initialize
    @x_array_of_wins = GameHelper.populate_array_of_wins
    @o_array_of_wins = GameHelper.populate_array_of_wins
    # puts "X array: #{@x_array_of_wins}"
    # puts "O array: #{@o_array_of_wins}"
  end

  def remove_from_x_array(cell_to_remove)
    @x_array_of_wins = @x_array_of_wins.map{|b| b if b.index(cell_to_remove) == nil }.compact
    nil
  end

  def remove_from_o_array(cell_to_remove)
    @o_array_of_wins = @o_array_of_wins.map{|b| b if b.index(cell_to_remove) == nil }.compact
    nil
  end

  def detect_win(player, game_board)
    if player.eql?("O")
      array_of_wins = @o_array_of_wins
    else
      array_of_wins = @x_array_of_wins
    end
    return false if array_of_wins.length == 0
    array_of_wins.each do |y|
      return true if game_board.get_space(y[0]).eql?(player) && game_board.get_space(y[1]).eql?(player) && game_board.get_space(y[2]).eql?(player)
    end
    return false
  end

  def detect_tie
    @x_array_of_wins.length == 0
  end


end
