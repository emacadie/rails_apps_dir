require "redis"
require 'securerandom'

class RedisRunner
  
  def  initialize
    @redis = Redis.new
  end

  def try_some_stuff
    @array_of_keys = @redis.keys
    print_array_of_keys
    puts "Now just trying to get the ones that start with s"
    just_s = "s*"
    # this works: array_of_keys = @redis.keys('s*')
    @array_of_keys = @redis.keys(just_s)
    print_array_of_keys

    @redis.set("random_1", SecureRandom.uuid)
    @redis.set("random_2", SecureRandom.uuid)
    @array_of_keys = @redis.keys
    print_array_of_keys
    @redis.del("random_1")
    @redis.del("random_2")
    puts "deleted the random keys"
    @array_of_keys = @redis.keys
    print_array_of_keys
  end

  def print_array_of_keys 
    @array_of_keys.each do |aok|
      puts "key: #{aok} value: #{@redis.get(aok)}"
    end
    puts " "
  end

  def load_keys_from_file(file_path)
    key_list = File.read(file_path)
    key_list.each_line do |a_key|
      the_pair = a_key.split('::')
      @redis.set(the_pair[0], the_pair[1].chomp)
    end
    @array_of_keys = @redis.keys
    puts "in load_keys_from_file"
    print_array_of_keys
  end

  def delete_keys_from_file(file_path)
    key_list = File.read(file_path)
    key_list.each_line do |a_key|
      the_pair = a_key.split('::')
      @redis.del(the_pair[0])
    end
    @array_of_keys = @redis.keys
    puts "in delete_keys_from_file"
    print_array_of_keys
  end

  def get_value(key)
    return @redis.get(key)
  end

  def delete_key(key)
    @redis.del(key)
    nil
  end

end



r_runner = RedisRunner.new
# r_runner.try_some_stuff
# r_runner.load_keys_from_file("")
# r_runner.delete_keys_from_file("/blah/blah/blah")
#- EOF
