require_relative 'array_extensions'

module BSS

  # Public: Index-pairs to transform source into target.
  #
  # A swap is a pair of indices which when applied to an array results in a
  # different ordering of that array.
  #
  # a - The source array
  # b - The target array
  #
  # Examples
  #
  #  swaps([1,2,3], [2,3,1])
  #  # => [[0,1],[1,2]]
  #
  # Returns an array of swaps.
  def self.swaps(a, b)
    source = a.dup
    target = b
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

  # Public: Swap the elements of the tuple at the given indices
  #
  # A swap is a pair of indices which when applied to an array results in a
  # different ordering of that array.
  #
  # swap - An index pair
  # tuple - An ordered set.
  #
  # Examples
  #
  #   apply!([0,3], [1,2,3])
  #   # => [3,2,1]
  #
  # Returns the effects of tuple + swap.
  def self.apply!(swap, tuple)
    tuple.swap_indices!(*swap)
  end
end
