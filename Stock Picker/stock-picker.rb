def stock_picker(array)
    min_price = array[0]
    min_index = 0
    profit = 0
    days = [0, 0]

    array.each_with_index do |price, index|
      if price < min_price 
        min_price = price
        min_index = index
      end

      if price - min_price > profit
        profit = price - min_price
        days = [min_index, index]
      end
    end
    days
end

arr = [17,3,6,9,15,8,6,1,10]
p stock_picker(arr)