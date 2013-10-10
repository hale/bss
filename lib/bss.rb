module BSS

  # The swaps needed to transform source into target.
  #
  # A swap is a pair of indices which when applied to source, 
  def self.swaps(source, target)
    [].tap do |swaps|
      source.length.times do |index|
        current = source[index]
        desired = target[index]
        if current != desired
          swaps << [index, source.index(desired)]
          source.swap_indices!(*swaps.last)
        end
      end
    end
  end

  def self.apply!(swap, tuple)
    tuple.swap_indices!(*swap)
  end
end

class Array
  def swap_indices!(i, j)
    self[i],self[j] = self[j],self[i]
    self
  end
end
