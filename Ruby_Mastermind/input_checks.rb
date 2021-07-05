def valid_code(input)
  if input.size > 4 || input.split('').any? { |num| num.to_i > 6 || num.to_i < 1 }
    puts 'Please pick only 4 numbers ranging from 1 to 6'
    input = gets.chomp
    valid_code(input)
  else
    input
  end
end

def valid_input?(input)
  if input.to_s.length == 4
    input
  else
    input_error
    input = gets.chomp
    valid_input?(input)
  end
end
