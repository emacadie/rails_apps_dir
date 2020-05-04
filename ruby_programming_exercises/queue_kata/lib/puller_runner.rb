#
require 'thread'

p_count = ARGV[0]
if p_count.nil?
  p_count = "2"
end
p_count = p_count.to_i

queue = Queue.new

puts "starting pusher"
pusher = Thread.new do
  i = 0
  while(true) do
    queue << i
    sleep 0.5
    # puts "Adding #{i} to queue"
    i = i + 1
    true
  end
end

sleep 20

puts "starting pulls"
pullers = []
y = 0
p_count.times do
   
  y = y + 1
  t = Thread.new {
    while true do
      puts "#{Thread.current.object_id}: #{queue.pop}"
      sleep(rand(0..2))
    end
  }
  pullers << t
  sleep 0.7
  t.run
  puts "New thread"
end

while true do
  # It is supposed to print forever  
end


#
