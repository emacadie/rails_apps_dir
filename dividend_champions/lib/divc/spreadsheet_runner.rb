module Divc
  require_relative 'spreadsheet_loader'

  class SpreadsheetRunner
    def initialize
    end
  end

  sl = SpreadsheetLoader.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4])
  sl.load_sheet

end
