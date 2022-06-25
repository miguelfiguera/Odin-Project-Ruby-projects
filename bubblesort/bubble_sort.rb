a=[4,3,78,2,0,2,124,1001,-5,-16,-17,6]

def bubble_sort(array)
    n = array.length
    loop do
        swapped = false
         (n-1).times do |i| 
             if array[i] > array[i+1]
             array[i],array[i+1]=array[i+1],array[i]
             swapped=true
            end
        end
        break if not swapped
    end
    puts array
end


bubble_sort(a)