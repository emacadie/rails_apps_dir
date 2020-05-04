class GameBoard
  attr_reader :user_board

  def initialize
    @user_board = Array.new(9) {"_"}
  end
    
  def space_available(the_input)
    @user_board[the_input.to_i].eql?("_")
  end
  
  def get_space(space_num)
    return @user_board[space_num]
  end
  
  def send_board_to_formatter
    copy_array = @user_board
    copy_array
  end
  
  def input_is_num(the_input)
    (the_input =~ /\d/) && ( 0 <= the_input.to_i && the_input.to_i <= 8 )
  end

  def make_computer_move(the_input)
    if input_is_num(the_input.to_s) && self.space_available(the_input) 
      @user_board[the_input.to_i] = "O"
    end
  end
  
  def make_user_move(the_input)
    if input_is_num(the_input.to_s) && self.space_available(the_input) 
      @user_board[the_input.to_i] = "X"
    end
  end

  def all_edges_blank
    return self.space_available("1") &&
      self.space_available("3") &&
      self.space_available("5") &&
      self.space_available("7")
  end

  def x_has_first_two_corners
    return true if self.get_space(0).eql?("X") && self.get_space(8).eql?("X") && 
      self.get_space(2).eql?("_") && self.get_space(6).eql?("_")
    return true if self.get_space(2).eql?("X") && self.get_space(6).eql?("X") && 
      self.get_space(0).eql?("_") && self.get_space(0).eql?("_")
  end
  
end

