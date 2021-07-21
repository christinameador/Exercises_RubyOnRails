
def fact(n)
  if n == 1
    1
  else
    n * fact(n-1)
  end
end

  
def palendrome(str)
if str.length <= 1
  true
elsif str[0] == str [-1]
  palendrome(str[1..-2])
  
else
  false
end
end

# p palendrome('1234321')
# p palendrome('12345678')


def beer(n)
  if n == 0 
    puts "no more bottles of beer on the wall"
  else
    puts "#{n} bottles of beer on the wall"
    beer(n-1)
  end
end

# beer(99)


def fib_pos(num, arr = [0, 1])
  return 0 if num == 0

  if arr.length-1 >= num
    # p arr
    return arr [-1]

  else
    arr << (arr[-2] + arr[-1])
    #p arr
    fib_pos(num, arr)
  end
end


#  p fib_pos(1)
#  p fib_pos(2)
#  p fib_pos(3)
#  p fib_pos(4)
#  p fib_pos(5)
#  p fib_pos(6)
#  p fib_pos(7)



def flattener(arr, result = [])
  arr.each do |element|
    if element.instance_of?(Array)
      flattener(element, result)
    else
      result << element
    end
  end
  result
end

arr = [[1,2,3,4,5,[[6,7,8],[9,[[1, [1, [8, 9]], [3, 4]]]]]]]

p flattener(arr)



