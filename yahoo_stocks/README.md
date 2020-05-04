This is a port of something I wrote in Perl that gets csv files with stock info from Yahoo 
and puts them into one large csv file. I was able to incorporate Redis a bit as well.   
   
However, there are a lot of stocks that trade on foreign exchanges in the lists, For example, for 
Advanced Micro Devices there is "AMD", "AMD.DE" and "AMD.MX" on the website, 
but all three are just "Advanced Micro Devices" in the csv file. So it is a bit hard to distinguish them.  

Anyway, to run it:  
First:   
bundle install  


You should be able to run this by calling  
bash bin/run.create.stock.csv.sh  

lib/redis_runner.rb just tries out some Redis stuff. Some of the methods are commented out.   

I tried to use environment variables for file paths.  

