module Divc
require 'spreadsheet'
require 'mongoid'
require_relative 'stock'

  class SpreadsheetLoader
    attr_reader :file_path
    attr_reader :sheet_name
    attr_reader :arg_date
    def initialize(sp_path, sht_name, a_date, mongo_path, mongo_env="development")
      @arg_date = a_date
      @file_path = sp_path
      @sheet_name = sht_name
      Mongoid.load!(mongo_path, mongo_env.to_sym)
      puts "hello"
    end

    def get_formula(cell_val)
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

    def get_market_cap(cell_val)
      return "$" + cell_val.to_s + "M"
    end

    def load_sheet
      book = Spreadsheet.open(@file_path)
      sheets = book.worksheets
   
      sheets.each do |sheet|
        name = sheet.name
        puts "-- sheet is a #{sheet.class} called #{sheet.name} which has #{sheet.last_row_index} rows"
        if sheet.name == @sheet_name
          process_sheet(sheet)
        end
      end
    end # end def load_sheet

    def process_sheet(sheet)
      for i in 1..(sheet.last_row_index)
        puts "Here is row #{i}: #{sheet.row(i)}"
        puts "sheet.row(i).class: #{sheet.row(i).class}"
        puts "sheet.row(i).length: #{sheet.row(i).length} "

        create_stock(sheet.row(i))
    
        sheet.row(i).each do |r|
          print "next val: #{r} - it's a #{r.class} || "
          if r.is_a? Spreadsheet::Formula
            print " = it's a Spreadsheet::Formula : value: #{r.value} ||"
          end
        end
        print "\n-------------------\n"
      end
    end

    def create_stock(the_row)
      puts "Here is moving average: #{the_row[34]}"
      puts "Here is moving average: #{the_row[34].class}"
      
      Stock.create(
        company:  the_row[0],
        symbol:   the_row[1],
        industry: the_row[2],
        years:    the_row[3],
        sequence: the_row[4],
        dr_fee:   the_row[5],
        sp_fee:   the_row[6],
        price:    the_row[7],
        d_yield:  get_formula(the_row[8]),
        old_rate: the_row[9],
        new_rate: the_row[10],
        percent_increase: get_formula(the_row[11]),
        ex_div_date:   get_date(the_row[12]),
        record_date:   get_date(the_row[13]),
        pay_date:      get_date(the_row[14]),
        qrtrly_schdl:  the_row[15],
        note:          the_row[16],
        annual_div:    get_formula(the_row[17]),
        payout_ratio:  get_formula(the_row[18]),
        pct_vs_graham: get_formula(the_row[19]),
        ttm_pe:       get_formula(the_row[20]),
        fye_month:    the_row[21],
        ttm_eps:      the_row[22],
        peg_ratio:    the_row[23],
        ttm_p_sales:  the_row[24],
        mrq_p_book:   the_row[25],
        ty_pct_growth: the_row[26],
        ny_pct_growth: the_row[27],
        est5YrGrowth:  get_formula(the_row[28]),
        # num_analysts:  the_row[29],
        mrkt_cap:      get_market_cap(the_row[30]),
        beta:          the_row[31],
        # fifty_two_wk_low:  the_row[32],
        # fifty_two_wk_high: the_row[33],
        # mving_avg_50_day:  the_row[34],
        # mving_avg_200_day: the_row[35],
        accel_decel:     get_formula(the_row[36]),
        div_growth01yr:  get_formula(the_row[37]),
        div_growth03yr:  get_formula(the_row[38]),
        div_growth05yr:  get_formula(the_row[39]),
        div_growth10yr:  get_formula(the_row[40]),
        div_2011:        get_formula(the_row[41]),
        div_2010:        the_row[43],
        div_2009:        the_row[44],
        div_2008:        the_row[45],
        div_2007:        the_row[46],
        div_2006:        the_row[47],
        div_2005:        the_row[48],
        div_2004:        the_row[49],
        div_2003:        the_row[50],
        div_2002:        the_row[51],
        div_2001:        the_row[52],
        div_2000:        the_row[53],
        div_1999:        the_row[54],
        c2011_vs_2010:   get_formula(the_row[55]),
        c2010_vs_2009:   get_formula(the_row[56]),
        c2009_vs_2008:   get_formula(the_row[57]),
        c2008_vs_2007:   get_formula(the_row[58]),
        c2007_vs_2006:   get_formula(the_row[59]),
        c2006_vs_2005:   get_formula(the_row[60]),
        c2005_vs_2004:   get_formula(the_row[61]),
        c2004_vs_2003:   get_formula(the_row[62]),
        c2003_vs_2002:   get_formula(the_row[63]),   
        c2002_vs_2001:   get_formula(the_row[64]),
        c2001_vs_2000:   get_formula(the_row[65]),
        c2000_vs_1999:   get_formula(the_row[66]),
        mean:            get_formula(the_row[67]),
        std_dev:         get_formula(the_row[68]),
        tweed_factor:    get_formula(the_row[69]),
        confidence_factor: get_formula(the_row[70]),
        est2012div:      get_formula(the_row[71]),
        est2013div:      get_formula(the_row[72]),
        est2014div:      get_formula(the_row[73]),
        est2015div:      get_formula(the_row[74]),
        est2016div:      get_formula(the_row[75]),
        payback5yrDollar: get_formula(the_row[76]),
        payback5yrPercent: get_formula(the_row[77]),
        category:        @sheet_name,
        date:            @arg_date
      )

    end

  end
end
