module Divc
require 'spreadsheet'
require 'mongoid'
require_relative 'stock'

  class SpreadsheetTester
    attr_reader :file_path
    attr_reader :sheet_name
    attr_reader :arg_month
    def initialize(sp_path, sht_name, month, mongo_path, mongo_env="development")
      @arg_month = month
      @file_path = sp_path
      @sheet_name = sht_name
      Mongoid.load!(mongo_path, mongo_env.to_sym)
      puts "hello"
    end

    def get_percent(cell_val)
      if cell_val.is_a? Spreadsheet::Formula
        return cell_val.value
      end
      return nil
    end

    def get_date(cell_val)
      if cell_val.is_a? Date
        return cell_val
      end
      return nil
    end

    def load_sheet
      book = Spreadsheet.open(@file_path)
      puts "book is a #{book.class}"
      sheets = book.worksheets
      puts "sheets is a #{sheets.class}"
      sheets.each do |sheet|
        name = sheet.name
        puts "-- sheet is a #{sheet.class} called #{sheet.name} which has #{sheet.last_row_index} rows"
        if sheet.name == @sheet_name
          for i in 1..(sheet.last_row_index)
            puts "Here is row #{i}: #{sheet.row(i)}"
            puts "sheet.row(i).class: #{sheet.row(i).class}"
            puts "sheet.row(i).length: #{sheet.row(i).length} "

            Stock.create(
              company:  sheet.row(i)[0],
              symbol:   sheet.row(i)[1],
              years:    sheet.row(i)[2],
              drip:     sheet.row(i)[3],
              old_rate: sheet.row(i)[4],
              new_rate: sheet.row(i)[5],
              percent_increase: get_percent(sheet.row(i)[6]),
              ex_div_date: get_date(sheet.row(i)[7]),
              record_date: get_date(sheet.row(i)[8]),
              pay_date:    get_date(sheet.row(i)[9]),
              press_release: sheet.row(i)[10],
              web_site: sheet.row(i)[11],
              note: sheet.row(i)[12],
              month: @arg_month
            )
            
            sheet.row(i).each do |r|
              print "next val: #{r} - it's a #{r.class} || "
              # if r.class.to_s == "Spreadsheet::Formula"
              if r.is_a? Spreadsheet::Formula
                print " = it's a Spreadsheet::Formula : value: #{r.value} ||"
              end
            end
            print "\n-------------------\n"
          end
        end
      end
    end
  end
end
