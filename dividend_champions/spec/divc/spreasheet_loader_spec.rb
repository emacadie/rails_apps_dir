require "spec_helper"
module Divc
  describe SpreadsheetLoader do
    it "asks if Obama lives here" do
      sp_load = Divc::SpreadsheetLoader.new("/home/ericm/github/dividend_champions/data/071231.xls")
      sp_load.first_method

    end

  end
end

