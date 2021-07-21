roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

def to_roman(roman_mapping, int, collector = [])
  roman_mapping.each_pair do |key, value|
    return collector.join{''} if int <= 0  

    if int >= key
      int -= key
      collector << value
      
      
      return to_roman(roman_mapping, int, collector)
     # return collector.join('')  
    end
  end
end

p to_roman(roman_mapping, 4)
p to_roman(roman_mapping, 8999)
