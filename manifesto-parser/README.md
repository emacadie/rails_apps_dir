A few small scripts/programs parsing the Craftsmanship Manifesto map file
using Nokogiri and some JSON.  

It's not always idiomatic Ruby. I just did it to work with Nokogiri and JSON. I 
think I like JSON better (but it is good to know something about XML)  

The scripts in bin/ can be run with bash, and they run a file in lib/

crack_is_whack converts an XML file to JSON

first_json_attempt is my first crack using JSON  

first_parser uses the Node class to parse the XML file

first_path_parser uses the XPath API, and is the first version of path_parser. Lots more comments and extra stuff  
And I know that both this and path_parser send a .csv path as an arg but write out a tab-delimited file.  
The data has commas, and to open a tab-delimited file in LibreOffice you need to make it comma-delimited.  

json_parser is the better script using JSON  

path_parser uses the XPath API, and I think it is a lot easier

show_parser is a test using the "show.xml" file that is at the Nokogiri site: http://nokogiri.org/