module States
  module Illini
    module Champaign
      describe Urbana do
        it "tells us its better" do
          ur = Urbana.new
          ur.is_it_better.should be_true
        end
        it "gives the percentage of the univeristy it has" do
          ur2 = Urbana.new
          ur2.percentage_of_university.should == 55
        end
      end
    end
  end
end
