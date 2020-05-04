class CsvLine

  attr_reader :the_line
  attr_reader :line_num
  attr_reader :valid_line
  
  attr_reader :description
  attr_reader :one_day_price_chg
  attr_reader :market_cap
  attr_reader :pe_ratio
  attr_reader :roe
  attr_reader :div_yield
  attr_reader :debt_to_equity
  attr_reader :price_to_book
  attr_reader :net_profit_marginMRQ
  attr_reader :price_to_free_cash_flowMRQ

  def initialize(line, number = 0)
    @the_line = line
    @line_num = number
    @valid_line = true
    parse_line
    check_validity
    clean_up
    if @valid_line
      prepare_market_cap
    end
  end

  def check_validity
    bad_count = -1 
    ivs = self.instance_variables
    null_count = 0
    
    ivs.each do |iv|
      null_count += 1 if self.instance_variable_get(iv).nil?
      if (self.instance_variable_get(iv).is_a? String) && (self.instance_variable_get(iv).include? "\"NA\"")
        bad_count += 1
      end
    end
    if (bad_count > 3) || (null_count > 3)
      @valid_line = false
    else
      @valid_line = true
    end
  end

  def parse_line
    @the_line =~ /^(\".*\"),(.*),(.*),(.*),(.*),(.*),(.*),(.*),(.*),(.*)/;
    @description = $1
    @one_day_price_chg = $2
    @market_cap = $3
    @pe_ratio = $4
    @roe = $5
    @div_yield = $6
    @debt_to_equity = $7
    @price_to_book = $8
    @net_profit_marginMRQ = $9
    @price_to_free_cash_flowMRQ = $10
  end

  def clean_up
    if !@description.nil?
      @description.delete!("\"")
    end
  end

  def prepare_market_cap
    if @market_cap =~ /.*B/
      @market_cap.delete "B"
      @market_cap = (@market_cap.to_f * 1000000000).to_s
    elsif @market_cap =~ /.*M/
      @market_cap.delete "M"
      @market_cap = (@market_cap.to_f * 1000000).to_s
    end
    @market_cap.sub!(/\.0/, "") if @market_cap =~ /\.0/ 
    @market_cap = @market_cap.reverse.gsub(/(\d\d\d)(?=\d)(?!\d*\.)/,'\1_').reverse 
  end

  def print_line
    return "#{@description},#{@one_day_price_chg},#{market_cap},#{pe_ratio},#{roe},#{div_yield},#{debt_to_equity}"
  end

end
