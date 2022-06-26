to_sort = Array.new(10) {rand(1..100)}


def merge_sort(array)
    
    #Base case
    if array.length < 2
        array
    end

    mid = array.length / 2


    #divide an array until length == 1
    #compare the result of the result and push the lesser value
    #