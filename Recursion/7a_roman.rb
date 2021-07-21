roman_mapping = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

def from_roman(roman_mapping, num, collector = 0)
  roman_mapping.each_key do |key|
    return collector if num.length == 0

    if num.start_with?(key)
      collector += roman_mapping[key]
      num.slice! (0..(key.length - 1))
      return from_roman(roman_mapping, num, collector)
    end
  end
end


p from_roman(roman_mapping, 'MCMXXXVII')
p from_roman(roman_mapping, 'MCMXXXIV')
p from_roman(roman_mapping, 'MMMCDCXVIII')