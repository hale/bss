require_relative '../lib/bss'
require_relative '../lib/array_extensions'

def random_sequence(max_length: 10)
  [].tap do |sequence|
    max_length.times do
      sequence << Random.rand(max_length).to_i
    end
  end.uniq
end
