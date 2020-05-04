# require "spec_helper"
module States
  module Illini
    describe ChampaignCounty do
      it "gives biggest city" do
        cc = ChampaignCounty.new
        cc.largest_city.should.eql?("Champaign")
      end

      it "gives county seat" do
        cc2 = ChampaignCounty.new
        cc2.county_seat.should.eql?("Urbana")
      end

    end
  end
end
