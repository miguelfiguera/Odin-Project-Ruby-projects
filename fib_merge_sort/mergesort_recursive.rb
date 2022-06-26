require 'pry'

to_sort = Array.new(10) { rand(1..100) }

def merge_sort(array)
  # Base case
  return array if array.length  <2

  binding.pry
  mid = array.length / 2

  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid..-1])

  # Sorting and merging
  result = []
  until left.empty? || right.empty?
  left.first <= right.first ? result.push(left.shift) : result.push(right.shift) 
  end
  result + left + right 
end

 p merge_sort(to_sort)
