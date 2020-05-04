This is a project using Mongoid

To use Mongoid, you set up the gems, blah, blah

I put the config file in ./config/mongoid.yml
 
To read it, you need to do two things.

1. Set an environment variable telling Mongoid which environment you are using (this is set in mongoid.yml)

2. In your Ruby code, do something like this:
require 'mongoid'                                                         
Mongoid.load!("/path/to/config/mongoid.yml") 

I decided to use Mongo because I am loading data from spreadsheets. There is a site that uploads data 
for dividend stocks once a month. I have noticed that they have added columns over time. So I thought 
that Mongo would be a good choice. This means I will have to change the class a few times and probably 
run things manually.  


This also uses the "spreadsheet" gem:  
http://spreadsheet.rubyforge.org/  
http://spreadsheet.ch/  
https://github.com/zdavatz/spreadsheet  
   

I am using genghis to view mongo:  
genghisapp  
genghisapp --kill  
http://localhost:5678/  

