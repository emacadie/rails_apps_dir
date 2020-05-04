module Divc
require 'mongoid'

  class Stock
    include Mongoid::Document
    field :company,     type: String
    field :symbol,      type: String
    field :industry,    type: String
    field :years,       type: Integer
    field :sequence,    type: Integer
    field :dr_fee,      type: String
    field :sp_fee,      type: String
    field :price,       type: Float
    field :d_yield,     type: Float
    field :old_rate,    type: Float
    field :new_rate,    type: Float
    field :percent_increase, type: Float
    field :ex_div_date,   type: Date
    field :record_date,   type: Date
    field :pay_date,      type: Date
    field :qrtrly_schdl,  type: String
    field :note,          type: String
    field :annual_div,    type: Float
    field :payout_ratio,  type: Float
    field :pct_vs_graham, type: Float
    field :ttm_pe,        type: Float
    field :fye_month,     type: Integer
    field :ttm_eps,       type: Float
    field :peg_ratio,     type: Float
    field :ttm_p_sales,   type: Float
    field :mrq_p_book,    type: Float
    field :ty_pct_growth, type: Float # changed
    field :ny_pct_growth, type: Float # changed
    field :est5YrGrowth,  type: Float
    field :num_analysts,  type: String
    field :mrkt_cap,      type: String
    field :beta,          type: Float
    # field :fifty_two_wk_low,  type: Float
    # field :fifty_two_wk_high, type: Float
    # field :mving_avg_50_day,  type: Float
    # field :mving_avg_200_day, type: Float
    field :accel_decel,    type: Float
    field :div_growth01yr, type: Float
    field :div_growth03yr, type: Float
    field :div_growth05yr, type: Float
    field :div_growth10yr, type: Float
    field :div_2011,       type: Float
    field :div_2010,       type: Float
    field :div_2009,       type: Float
    field :div_2008,       type: Float
    field :div_2007,       type: Float
    field :div_2006,       type: Float
    field :div_2005,       type: Float
    field :div_2004,       type: Float
    field :div_2003,       type: Float
    field :div_2002,       type: Float
    field :div_2001,       type: Float
    field :div_2000,       type: Float
    field :div_1999,       type: Float
    field :c2011_vs_2010,  type: Float
    field :c2010_vs_2009,  type: Float
    field :c2009_vs_2008,  type: Float
    field :c2008_vs_2007,  type: Float
    field :c2007_vs_2006,  type: Float
    field :c2006_vs_2005,  type: Float
    field :c2005_vs_2004,  type: Float
    field :c2004_vs_2003,  type: Float
    field :c2003_vs_2002,  type: Float
    field :c2002_vs_2001,  type: Float
    field :c2001_vs_2000,  type: Float
    field :c2000_vs_1999,  type: Float
    field :mean,           type: Float
    field :std_dev,        type: Float
    field :tweed_factor,   type: Float
    field :confidence_factor, type: Float
    field :est2012div, type: Float
    field :est2013div, type: Float
    field :est2014div, type: Float
    field :est2015div, type: Float
    field :est2016div, type: Float
    field :payback5yrDollar, type: Float
    field :payback5yrPercent, type: Float
    field :category,       type: String
    field :s_date,         type: String # this is done manually as an arg
  end  

# good for 2007-12
end
