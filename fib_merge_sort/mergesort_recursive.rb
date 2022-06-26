require 'pry'

to_sort = Array.new(10) { rand(1..100) }

def merge_sort(array)
  # Base case
  binding.pry
  return array if array.length < 2

  mid = array.length / 2

  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid + 1...-1])

  # Sorting and merging
  result = []
  left.first < right.first ? result.push(left.first) : result.push(right.first) until left.empty? || right.empty?

  good_result = result.uniq!
  p good_result
end

merge_sort(to_sort)
