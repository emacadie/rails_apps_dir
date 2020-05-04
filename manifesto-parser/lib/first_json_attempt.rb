require 'json'

def main_sub
  json = File.read(ARGV[0])
  the_doc = JSON.parse(json)
  puts the_doc
  puts "\nthe_doc.class: #{the_doc.class}"
  puts "the_doc.keys: #{the_doc.keys}"

  stuff = the_doc["kml"] # kml
  puts "stuff: #{stuff}"
  puts "stuff.class: #{stuff.class}"
  puts "stuff.keys: #{stuff.keys}"
  next_doc = stuff["Document"]
  puts "next_doc: #{next_doc}"
  puts "next_doc.class: #{next_doc.class}"
  puts "next_doc.keys: #{next_doc.keys}"
  placemark = next_doc["Placemark"]
  puts "placemark: #{placemark}"
  puts "placemark.class: #{placemark.class}"

  placemark02 = the_doc["kml"]["Document"]["Placemark"]
  puts "placemark02: #{placemark02}"
  puts "placemark02.class: #{placemark02.class}"
  puts "placemark.length: #{placemark.length}"
  puts "placemark02.length: #{placemark02.length}"
  output_file = File.new(ARGV[1], 'w')
  output_file.write("Name\tLocation\n")
  placemark02.each do |pm02|
    puts "Next element: #{pm02} and it's a #{pm02.class}"
    output_file.write(pm02["name"])
    output_file.write("\t")
    output_file.write(pm02["description"])
    output_file.write("\n")
  end
  output_file.close
# =end
end

main_sub  
