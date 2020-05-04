module Divc
  require_relative 'spreadsheet_tester'

  class SpreadsheetRunner
    def initialize
    end
  end

  sl = SpreadsheetTester.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4])
  sl.load_sheet
  

end
