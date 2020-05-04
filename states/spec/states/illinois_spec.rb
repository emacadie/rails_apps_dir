require "spec_helper"
module States
  describe Illinois do
    it "asks if Obama lives here" do
      illinois = Illinois.new
      illinois.obama_lives_here.should be_true
    end

    it "asks if Biden lives here" do
      il2 = Illinois.new
      il2.biden_lives_here.should be_false
    end

  end
end
