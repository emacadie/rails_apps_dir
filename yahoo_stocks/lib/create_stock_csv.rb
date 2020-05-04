require_relative 'csv_line'
require_relative 'redis_runner'

# /home/ericm/tmp/money/yahooStocks/work.pl
# /cygdrive/c/EKM/yahooStocks 
# "Description","1-Day Price Chg %","Market Cap","P/E","ROE %","Div. Yield %","Debt to Equity","Price to Book","Net Profit Margin (mrq)","Price To Free Cash Flow (mrq)"

def main_sub

  time_var = `date +%Y-%m-%d_%H.%M.%S`;
  some_dir = "./";

  csv_file_list = File.read(ENV["CSV_FILE_LIST"])
  $fileCount = 0;
    
  $dateCommand = "date  +%Y-%m-%d_%H:%M:%S";
  header_string = "Description,1-Day Price Chg \%,Market Cap,P/E,ROE \%,Div. Yield \%,Debt to Equity,Price to Book,Net Profit Margin (mrq),Price To Free Cash Flow (mrq),Sector,Industry";
  command_string = String.new
  csv_file_list.each_line do |line|
  
    puts "Here is line: #{line}"
    command_string = "wget " + line
    # This works - commenting out for now
    # output = `wget #{line}` 
    
    puts "\n-------------\n"
    # sleep( 0.3 )
  end

  @r_runner = RedisRunner.new
  redis_file = ENV["REDIS_FILE"]
  @r_runner.load_keys_from_file(redis_file)

  output_file_path = some_dir + "anotherOutput.txt"
  output_file = File.open(output_file_path, 'w')
  output_file.write(header_string + "\n")
  output_file.close
  files_tmp = Dir.entries(Dir.getwd).sort
  # I could do it in one line, but this seems a bit cleaner to me - enough chaining as it is
  files = files_tmp.map{|f| f if f.include? 'conameu.csv'}.compact
  files.each do |the_file|
    puts "opening the_file: #{the_file}"
    get_industry_and_sector(the_file, output_file_path)
  end
  # $command = "mv -v $outputFile some_dir" . "output.$TIME_VAR.csv";
  # print `$command`;

end # main_sub


def get_industry_and_sector(file_path, output_path )
  csv_array = File.readlines(file_path)
  total_lines = csv_array.length
  puts "Lines in file #{file_path}: #{total_lines}"
  output_file = File.open(output_path, 'a')
  line_num = 0
  industry = String.new
  sector = String.new

  csv_array.each do |next_line|    
    line_num += 1
    csv_line = CsvLine.new(next_line)
    next_line =~ /^(\".*\"),(.*),(.*),(.*),(.*),(.*),(.*),(.*),(.*),(.*)/;
    description = $1
    
    sector_industry = @r_runner.get_value(file_path)
    if (line_num > 3) && (csv_line.valid_line)
      # puts "There it is: #{csv_line.print_line},#{sector_industry} next_line.length: #{next_line.length}"
      output_file.write("#{csv_line.print_line},#{sector_industry}\n")
    end   
  end

  @r_runner.delete_key(file_path)
  output_file.close
end # get_industry_and_sector


puts "Starting !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
main_sub

the_var = ENV["AN_ARM"]
puts "Here is the var: #{the_var}"
the_ed = ENV["EDITOR"]
puts "Here is the ed: #{the_ed}"
redis_file = ENV["REDIS_FILE"]
puts "Here is redis file: #{redis_file}"

# EOF
