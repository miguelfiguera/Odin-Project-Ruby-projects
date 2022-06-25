prices= [17,3,6,9,15,8,6,1,10,36,23,24,25,29,16,12,7,6,3,2,1,9,16,19]

def stock_picker(array)
    max_value=array[1]
    min_value=array[0]
    buying_day = 0
    selling_day = 0

    array.each_with_index do |v,i|
        if max_value < v && 0 < i
            max_value=v 
            selling_day = i
        end
    end
    
    array.each_with_index do |v,i|
        if v < min_value && i < selling_day
            min_value = v 
            buying_day =i
        end
    end
    p [buying_day,selling_day]
    puts " For $#{max_value-min_value} profit, buy on #{buying_day} and sell on #{selling_day}"
end

stock_picker(prices)