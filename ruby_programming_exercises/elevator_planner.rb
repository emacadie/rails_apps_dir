class ElevatorPlanner

  attr_reader :positions
  attr_reader :requests
  

  def initialize(pos)
    @positions = pos
    @requests = Array.new
  end

  def request(floor)
    if floor.is_a?(Fixnum)
      @requests.push(floor)
    end
  end

  def positions=(args)
    @positions = args
  end

  @hold_array = Array.new

  def run
    puts "Here are the starting positions: #{@positions.inspect}"
    puts "Here are the requests: #{@requests.inspect}"
    positions.each_with_index do |p|
      x = 100 # find max of Fixnum later
      y = 0
      z = 0
      requests.each do |r|
        
        y = (p - r).abs
        if y < x
          x = y
          z = r
        end
      end
      puts "moved elevator from #{p} to #{y} and z is #{z}"
    end
  end

end
