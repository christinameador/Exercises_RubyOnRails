def fibs(n)
  arr = []
  i = 0
  while i <= n
    if (0..1).include?(i) 
      arr << i
    else
      arr << arr[i-1] + arr[i-2]
    end
    i += 1
  end
  arr
end


p fibs(8)

def fibs_rec(n)
 (0..1).include?(n) ? n : fibs_rec(n-1) + fibs_rec(n-2)
end

def make_arr(n)
  (0..n).each_with_object([]) { |num, arr| arr << fibs_rec(num)}
end





p fibs_rec(8)

p make_arr(8)

