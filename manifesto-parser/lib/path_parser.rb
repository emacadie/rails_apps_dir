require 'nokogiri'

def main_sub

  f = File.open(ARGV[0])
  doc = Nokogiri::XML(f)
  f.close
  puts "Here is doc.class: #{doc.class}"
  root = doc.root
  puts "root.namespaces: #{root.namespaces}"

  d_x = doc.xpath("//xmlns:Placemark")
  d_x_first = d_x.first

  placemarks = doc.xpath("//xmlns:Placemark")

  hold_string = String.new
  str_array = Array.new
  placemarks.each do |placemark|
    name = placemark.xpath("xmlns:name")
    hold_string.concat(name.text)
    hold_string.concat("\t")

    name.each do |nc|
      # puts "---- nc: #{nc} | and it's a #{nc.class} with this many children: #{nc.children.length}"
      # puts "---- which is #{nc.children.first} | and it's a #{nc.children.first.class}"
    end

    description = placemark.xpath("xmlns:description")
    hold_string.concat(description.text)
    description.each do |c|
      # puts "---- c as text: #{c.text}"
    end
    str_array.push(String.new(hold_string))
    puts "hold_string: #{hold_string.to_s}"
    hold_string.clear
  end

  puts "\n"

  output_file = File.open(ARGV[1], 'w')
  output_file.write("Name\tLocation\n")
  str_array.each do |x|
    output_file.write(x)
    output_file.write("\n")
  end

  output_file.close
end


puts "--------------------------------------------------------------"
main_sub
