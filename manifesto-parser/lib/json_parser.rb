require 'json'

def main_sub
  json = File.read(ARGV[0])
  the_doc = JSON.parse(json)

  placemark02 = the_doc["kml"]["Document"]["Placemark"]
  output_file = File.new(ARGV[1], 'w')
  output_file.write("Name\tLocation\n")
  
  placemark02.each do |pm02|
    output_file.write(pm02["name"])
    output_file.write("\t")
    output_file.write(pm02["description"])
    output_file.write("\n")
  end
  output_file.close

end

main_sub  
