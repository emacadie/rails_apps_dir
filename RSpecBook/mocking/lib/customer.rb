class Customer

  attr_accessor :name

  def initialize(name)
    @name = name
    puts "Setting name to #{name}"
  end

end
