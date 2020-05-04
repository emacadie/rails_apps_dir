require 'twitter'
class TwitterRunner
  # Twitter.update("I'm tweeting with @gem!")
  array_of_tweets = Twitter.user_timeline("EMacAdie2", {count: 1 })
  array_of_tweets.each do |t|
    puts "Here is t: #{t.to_s} and it's a #{t.class}"
    puts "t: #{t.text}"
    puts "t.attrs.size: #{t.attrs.size}"
    t_hash = t.attrs
    puts "t_hash.class: #{t_hash.class}"
    puts "t_hash.keys: #{t_hash.keys}"
    # puts "t_hash.keys.class: #{t_hash.keys.class}"
    # puts "t_hash[created_at]: #{t_hash[:created_at]}"
    print "{ "
    t_hash.each_with_index do |(k, v), index|
      if v.is_a?(String)
        print " :#{k}=> \"#{v}\"" # : #{t_hash[k]} "
      elsif v.is_a?(NilClass)
      else
        print ":#{k}=> #{v}" # : #{t_hash[k]} "
      end
      print " it's a #{v.class} " 
      puts " Index: #{index}"
      # puts "k[0]: #{k[0]}, k[1]: #{k[1]} which is  #{k[1].class}"
      
    end
    puts " }"
    puts "----------------------------------------------"
  end
end
