# chapter 14 in book
class Statement

  attr_accessor :customer


  def initialize(cust, logger = nil)
    @customer = cust
    @logger = logger
    puts " customer name is #{@customer.name}"
  end




  def generate
    name = @customer.name
    if @logger
      puts "About to call @logger.log"
      @logger.log("Statement generated for #{name}") # if @logger
      puts "About to call @logger.go_insane_right_now"
      @logger.go_insane_right_now("Going insane right now with #{name}") # if @logger
      puts "Just went INSAAAAAAAAAAAAAAAAAAANE!"
    end
    "Statement for #{name}"
    
  end

end
