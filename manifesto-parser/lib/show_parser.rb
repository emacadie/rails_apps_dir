require 'nokogiri'

def main_sub

  f = File.open(ARGV[0])
  doc = Nokogiri::XML(f)
  f.close
  puts "Here is doc.class: #{doc.class}"
  root = doc.root

  puts "Here is doc.xpath(\"//sitcoms\"): #{doc.xpath("//sitcoms")}"
  d_x = doc.xpath("//sitcoms")
  puts "d_x is a #{d_x.class}"
  d_x_first = d_x.first
  puts "d_x_first is a #{d_x_first.class}"
  puts "here is d_x_first: #{d_x_first}"

  puts "------------------------------------\n"
    puts "Here is doc.xpath(\"//sitcom\"): #{doc.xpath("//sitcom")}"
=begin
  sitcoms = doc.xpath("//sitcom")
  puts "sitcoms is a #{sitcoms.class} with this many elements: #{sitcoms.length}"

  sitcoms.each do |sitcom|
    puts "\n"
    puts "-- *** doing a sitcom"
    puts "-- getting the name"
    name = sitcom.xpath("name")
    puts "-- here is the name: #{name} and here it is as text: #{name.text}"
    puts "-- name is a #{name.class}"
    puts "-- here we go:"
    name.each do |nc|
      puts "---- nc: #{nc} | and it's a #{nc.class} with this many children: #{nc.children.length}"
      puts "---- which is #{nc.children.first} | and it's a #{nc.children.first.class}"
    end
    puts "-- now for the characters"
    characters = sitcom.xpath("characters/character")
    puts "-- characters: #{characters}"
    puts "-- it is a #{characters.class} with so many elements: #{characters.size}"
    characters.each do |c|
      puts "---- c as text: #{c.text}"
    end
  end
=end
  puts "\n"
  puts "Nokogiri::XML::Node.ELEMENT_NODE: #{Nokogiri::XML::Node::ELEMENT_NODE}"
  puts "Nokogiri::XML::Node.TEXT_NODE: #{Nokogiri::XML::Node::TEXT_NODE}"
end

main_sub
