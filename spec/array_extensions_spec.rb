require_relative 'spec_helper'

describe Array do
  describe "#swap_indices!" do
    it "swaps elements of an array at the given indices" do
      [1,2,3,4].swap_indices!(1, 3).should eq([1,4,3,2])
    end
  end
end
