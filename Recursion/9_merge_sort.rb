arr = [5, 2, 7, 11, 30, 29, 1, 5, 7, 3, 8, 7, 9, 6, 0]
arr_two = [1343, 642, 1136, 1337, 1451, 553, 1680, 1381, 1621, 137, 1932, 265, 393, 1423, 315, 1113, 996, 509, 1906, 1992, 1573, 514, 136, 806, 1211, 226, 772, 722, 1333, 1813, 837, 725, 1248, 1674, 1554, 1450, 978, 1927, 1068, 472, 1303, 816, 1777, 714, 1961, 1914, 1774, 319, 918, 687, 7]

def mrg_two(one, two, array = [])
  one.length.times { array << one.shift } if two.empty? && !one.empty?
  two.length.times { array << two.shift } if one.empty? && !two.empty?
  return array if one.empty? && two.empty?

  array << if one[0] < two[0]
             one.shift
           else
             two.shift
           end
  mrg_two(one, two, array)
end

def merge_sort(arr)
  one, *two = arr.each_slice( (arr.length/2.0).round).to_a
  two.flatten!
  arr.length > 2 ? mrg_two(merge_sort(one), merge_sort(two)) : mrg_two(one, two)
end

p merge_sort(arr)
p merge_sort(arr_two)