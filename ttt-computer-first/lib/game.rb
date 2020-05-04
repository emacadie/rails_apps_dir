class Game
  #> - allow for a human player to play against a computer-controlled player.
  #> - the computer player must win whenever possible, and should never lose.
  attr_reader :x_array_of_wins
  attr_reader :o_array_of_wins
  attr_reader :game_board
  attr_accessor :input
  attr_reader :on_first_move

  def initialize
    @game_board = Array.new(9, "_")
    @x_array_of_wins = populate_array_of_wins
    @o_array_of_wins = populate_array_of_wins
    @on_first_move = true
  end


  def get_input
    continue = true
    
    first_move = (0..8).entries.sample
    game_board[first_move] = "O"
    @x_array_of_wins = remove_from_array_of_wins(@x_array_of_wins, first_move)
    while continue == true
      print_board
      ask_for_input
      @input = gets
      @input = @input.chomp!
      if !input_is_num_or_q(@input)
        puts "You must enter a number from 0 to 8 to select a position, or 'Q' to quit"
      elsif @input =~ /Q/
        continue = false
      else
        if is_space_available(@input)
          self.set_game_board=(@input)
          self.make_move(@input)
        else
          puts "That space is taken. Pick another"
        end
      end
      if detect_win("O")
        print_board
        puts "Computer wins. GAME OVER"
        continue = false
      elsif detect_win("X")
        print_board
        puts "You have done the impossible. Now you are a Jedi. GAME OVER"
        continue = false
      end
      if @x_array_of_wins.length == 0
        print_board
        puts "No wins possible for you. GAME OVER"
        continue = false
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

  def set_game_board=(the_input)
    if input_is_num(the_input)
      @game_board[the_input.to_i] = "X"
      @o_array_of_wins = remove_from_array_of_wins(@o_array_of_wins, the_input)
    end
  end

  def make_move(usr_input)
    # puts @game_board.to_s
    
    if @on_first_move
      make_first_move(usr_input)
      @on_first_move = false
    else
      next_move = find_x_array_to_block!
      # puts "=> next_move: " + next_move.to_s
      # puts "=> plot_next_move: " + plot_next_move().to_s
      unless next_move.nil?
        @game_board[next_move] = "O"
        @x_array_of_wins = remove_from_array_of_wins(@x_array_of_wins, next_move)
      else
        next_move = plot_next_move()
        if next_move != nil
        end
      end
    end
  end
  
  def make_first_move(usr_input)
    # handle the corner cases
    the_number = nil
    if usr_input.eql?("0") || usr_input.eql?("2") || usr_input.eql?("6") || usr_input.eql?("8")
      # puts "It's a corner"
      the_number = 4
    elsif usr_input.eql?("1") || usr_input.eql?("3") || usr_input.eql?("5") || usr_input.eql?("7")
      the_number = handle_edge(usr_input)
    # they pick the center
    elsif usr_input.eql?("4")
      the_number = pick_random_corner()
    end
    @game_board[the_number] = "O"
    @x_array_of_wins = remove_from_array_of_wins(@x_array_of_wins, the_number)
  end
  
  # I could just do center, but I would rather mix it up a bit
  def handle_edge(usr_input)
    the_array = Array.new
    if usr_input.eql?("1")
      the_array.push(0,2,4,7)
    elsif usr_input.eql?("3")
      the_array.push(0,4,5,6)
    elsif usr_input.eql?("5")
      the_array.push(2,3,4,8)
    else # it's 7
      the_array.push(1,4,6,8)
    end
    the_array = the_array.map{|k| k if self.is_space_available(k.to_s)}.compact
    return the_array.sample
  end
  
  def remove_from_array_of_wins(first_array, cell_to_remove)
    return first_array.map{|b| b if b.index(cell_to_remove) == nil }.compact
  end
  
  def pick_random_corner
    corner_array = Array.new
    corner_array.push(0,2,6,8)
    return corner_array.sample
  end
  
  def create_x_used_array(array_of_wins)
    x_used = Array.new
    @x_array_of_wins.each do |x|
      has_used_spaces = false
      x.each do |xx|  
        if !self.is_space_available(xx.to_s)    
          if @game_board[xx] =~ /X/
            has_used_spaces = true
          end
        end
        if has_used_spaces
          x_used.push(x)
        end
      end  
      x_used.uniq!
    end  
    return x_used
  end
  
  # 
  def plot_next_move
    # this will count how many times an unused square is mentioned in the array of wins for X
    importance_array = Array.new(9, 0)
    # @x_array_of_wins.each do |c|
    x_used = self.create_x_used_array(@x_array_of_wins)
    x_used.each do |c|
      c.each do |d|
        importance_array[d] = importance_array[d] + 1
      end
    end
    the_num = importance_array.index(importance_array.max)
    if self.is_space_available(the_num.to_s)
      return the_num
  else 
      return nil
    end
  end
  
  # find winning x array for which there are already two spaces used
  def find_x_array_to_block!
    count_array = Array.new
    @x_array_of_wins.each do |x|
      used = 0 
      x.each do |xx|
        if !self.is_space_available(xx.to_s) 
            used = used + 1
        end
      end
      count_array.push(used)
    end
    
    array_to_crush = @x_array_of_wins[count_array.index(count_array.max)]
    num_to_use = nil
    array_to_crush.each do |x|
      if self.is_space_available(x.to_s)
        num_to_use = x
      end
    end
    return num_to_use
  end

  def is_space_available(the_input)
      if @game_board[the_input.to_i] == "_"
        return true
      else
        return false
      end
  end

  def detect_win(player)
    if player.eql?("O")
      array_of_wins = @o_array_of_wins
    else 
      array_of_wins = @x_array_of_wins
    end
    return false if array_of_wins.length == 0
    array_of_wins.each do |x|
      if @game_board[x[0]] == player && @game_board[x[1]] == player && @game_board[x[2]] == player
        return true
      end
    end
    return false
  end
  
  def print_board
    puts "------------------"
    puts "Here is the board: "
    puts "0: " + @game_board[0] + " 1: " + @game_board[1] + " 2: " + @game_board[2]
    puts "3: " + @game_board[3] + " 4: " + @game_board[4] + " 5: " + @game_board[5]
    puts "6: " + @game_board[6] + " 7: " + @game_board[7] + " 8: " + @game_board[8]
  end
  
  def ask_for_input
    puts "Select a square by entering the number, or hit 'Q' to quit"
    puts "Enter your selection here: "
  end

  private

    def populate_array_of_wins
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
end

