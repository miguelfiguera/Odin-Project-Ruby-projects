def fib_recursive(num)
  num < 2 ? num : fib_recursive(num - 1) + fib_recursive(num - 2)
end

def fib_iterative(num, array = [0, 1])
  if num < 2
    array[num]
  else
    array.push(array[-1] + array[-2]) until num == array.length
  end
  array
end

def fib_rec3(num, array = [0, 1])
num == array.length ? array : array.push(array[-1] + array[-2]) && fib_rec3(num,array)
end

# all of this work
