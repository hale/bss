class Array
  def swap_indices!(i, j)
    self[i],self[j] = self[j],self[i]
    self
  end
end
