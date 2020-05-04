require "rubygems"
require "crack"
require "json"

myXML  = Crack::XML.parse(File.read(ARGV[0]))
myJSON = myXML.to_json
puts myJSON
