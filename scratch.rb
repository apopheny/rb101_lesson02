numbers = [19, 2, 3, 38, 3, 9, 0]
saved_number = 0

numbers.each do |num|
  next unless num > saved_number

  saved_number = num
end

p saved_number
