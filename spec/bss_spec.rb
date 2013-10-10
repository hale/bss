require_relative '../lib/bss'

describe BSS do
  it "can permutate A into B given a list of swaps" do
    source = [1,2,3,4]
    target = [1,3,4,2]
    BSS.swaps(source, target).each do |swap|
      BSS.apply!(swap, source)
    end
    source.should eq(target)
  end

  it "works with random sequences" do
    source = random_sequence
    target = source.shuffle
    BSS.swaps(source, target).each do |swap|
      BSS.apply!(swap, source)
    end
    source.should eq(target)
  end

  describe "#apply_swap!" do
    it "works for 2 elements" do
      BSS.apply!([0,1], [2,3]).should eq([3,2])
    end

    it "works for 4 elements" do
      tuple = [1,4,2,3]
      swap = [1,3]
      swapped = [1,3,2,4]
      BSS.apply!(swap, tuple).should eq(swapped)
    end
  end

  describe "#swaps" do
    it "does nothing when the sequences are the same" do
      BSS.swaps([1,2,3], [1,2,3]).should eq([])
    end

    it "works for 2 elements" do
      a = [1,2]
      b = [2,1]
      BSS.swaps(a, b).should eq([[0,1]])
    end

    it "works for 6 elements" do
      a = [1,2,3,4,5,6]
      b = [6,5,2,4,3,1]
      swaps = [[0,5],[1,4],[2,4]]
      BSS.swaps(a, b).should eq(swaps)
    end

    it "works when there is a slight change" do
      a = [12, 132, 2, 22, 1, 32, 11]
      b = [12, 132, 1, 22, 2, 32, 11]
      BSS.swaps(a, b).should eq([[2, 4]])
    end
  end
end

def random_sequence(max_length: 10)
  [].tap do |sequence|
    max_length.times do
      sequence << Random.rand(max_length).to_i
    end
  end.uniq
end

describe Array do
  describe "#swap_indices!" do
    it "swaps elements of an array at the given indices" do
      [1,2,3,4].swap_indices!(1, 3).should eq([1,4,3,2])
    end
  end
end
