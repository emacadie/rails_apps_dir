require 'spec_helper'

describe Object do
  it 'should do something' do
    # puts "hello"
    billion_number = "3123456789"
    # puts "billion_number: #{billion_number}"
    reverse_str = billion_number.reverse
    # puts "reverse_str: #{reverse_str}"
    output_str = String.new
    # puts "reverse_str.slice(0,3): #{reverse_str.slice(0,3)}"
    # puts "reverse_str.slice(0,3).reverse: #{reverse_str.slice(0,3).reverse}"
    # reverse_str.delete!(reverse_str.slice(0,3))
    # puts "After reverse_str.delete!(reverse_str.slice(0,3)): #{reverse_str}"
    while reverse_str.length >= 3
      output_str.prepend(reverse_str.slice(0,3).reverse)
      output_str.prepend("_")
      reverse_str.delete!(reverse_str.slice(0,3))
      # puts "output_str: #{output_str} reverse_str: #{reverse_str}"
    end
    # puts "reverse_str: #{reverse_str}"
    
    again = billion_number.reverse.gsub(/(\d\d\d)(?=\d)(?!\d*\.)/,'\1_').reverse
    # puts "again: #{again}"

  end
end
