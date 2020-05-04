require 'nokogiri'

def main_sub

  f = File.open(ARGV[0])
  doc = Nokogiri::XML(f)
  f.close
  output_file = File.open(ARGV[1], 'w')
  puts "Here is doc.class: #{doc.class}"
  root = doc.root
  puts "root.namespaces: #{root.namespaces}"

  # doc.remove_namespaces!
  # puts "Here is doc.xpath(\"//Placemark\"): #{doc.xpath("Placemark")}"

  puts "Here is doc.xpath(\"//Placemark\"): #{doc.xpath("xmlns:Placemark")}"
  d_x = doc.xpath("//xmlns:Placemark")
  puts "d_x is a #{d_x.class}"
  d_x_first = d_x.first
  puts "d_x_first is a #{d_x_first.class}"
  puts "here is d_x_first: #{d_x_first}"

  puts "\n" 
  puts "Here is doc.xpath(\"//Placemark\"): #{doc.xpath("//xmlns:Placemark")}"
  placemarks = doc.xpath("//xmlns:Placemark")
  puts "placemarks is a #{placemarks.class} with this many elements: #{placemarks.length}"

  hold_string = String.new
  str_array = Array.new
  placemarks.each do |placemark|
    puts "\n"
    puts "-- *** doing a placemark"
    puts "Here it is: #{placemark}"
    puts "-- getting the name"
    name = placemark.xpath("xmlns:name")
    puts "-- here is the name: #{name} and here it is as text: #{name.text}"
    hold_string.concat(name.text)
    hold_string.concat("\t")
    puts "-- name is a #{name.class}"
    puts "-- here we go:"
    name.each do |nc|
      puts "---- nc: #{nc} | and it's a #{nc.class} with this many children: #{nc.children.length}"
      puts "---- which is #{nc.children.first} | and it's a #{nc.children.first.class}"
    end
    puts "-- now for the characters"
    description = placemark.xpath("xmlns:description")
    puts "-- description: #{description} as text: #{description.text}"
    hold_string.concat(description.text)
    puts "-- it is a #{description.class} with so many elements: #{description.size}"
    description.each do |c|
      puts "---- c as text: #{c.text}"
    end
    str_array.push(String.new(hold_string))
    puts "hold_string: #{hold_string.to_s}"
    hold_string.clear
  end

  puts "\n"
  str_array.each do |x|
    puts "string: #{x.to_s} is a #{x.class}"
    output_file.write(x)
    output_file.write("\n")
  end

  puts "\n"
  puts "Nokogiri::XML::Node.ELEMENT_NODE: #{Nokogiri::XML::Node::ELEMENT_NODE}"
  puts "Nokogiri::XML::Node.TEXT_NODE: #{Nokogiri::XML::Node::TEXT_NODE}"
  output_file.close
end


puts "--------------------------------------------------------------"
main_sub
