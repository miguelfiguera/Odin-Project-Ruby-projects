prices= [17,3,6,9,15,8,6,1,10,36,23,24,25,29,16,12,7,6,3,2,1,9,16,19,600]

def stonks(array)
    max=array[1]
    min=array[0]
    selling_day=0
    buying_day=0

    array.each_with_index do |n,i|
        if max<n && 0<i 
            selling_day=i
            max = n
        end
    end
    
    array.each_with_index do |n,i|
        if n<min && i < selling_day
            buying_day =i 
            min = n
        end
    end
    puts "For $#{max-min} profit per action, buy on #{buying_day} and sell on #{selling_day}"
end

stonks(prices)