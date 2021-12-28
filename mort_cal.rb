monthly_pmt = nil
monthly_rate = ""
name = ""
loan_value = nil
apr = nil
loan_duration = nil
# prompt method creates standard formatting for program messages
def prompt(message)
  puts "=> #{message}"
end

# number validation method
def valid_num?(number)
  number == number.to_i.to_s
end

# converts apr to monthly rate
def apr_to_monthly(rate)
  rate.to_f / 12
end

# performs the monthly pyment calculation
def calculation(val, m_rate, duration)
  val.to_i * (m_rate.to_f / (1.0 - (1.0 + m_rate.to_f)**(duration.to_i * -1)))
end

# begin program
prompt("Welcome to your mortgage and car loan calculator!")
prompt("Please enter your name:")
name = gets.chomp
loop do
  if name.empty?
    prompt("Please enter a valid name:")
    name = gets.chomp
  else break
  end
end
prompt("Greetings, #{name}!")
# begin main loop
loop do
  prompt("Would you like to perform a mortgage or car loan calculation? (y/n)")
  y_n = gets.chomp
  break if y_n.downcase.start_with?("n")
  prompt("What is the amount of your loan?")
  loan_value = gets.chomp
  loop do
    if valid_num?(loan_value)
      break
    elsif prompt("Please enter a valid loan amount:")
      loan_value = gets.chomp
    end
  end
  prompt("What is your loan's APR?")
  apr = gets.chomp
  loop do
    if valid_num?(apr)
      break
    elsif prompt("Please enter a valid APR")
      apr = gets.chomp
    end
  end
  apr = apr.to_f / 100
  monthly_rate = apr_to_monthly(apr)
  prompt("What is your loan's duration in months?")
  loan_duration = gets.chomp
  loop do
    if valid_num?(loan_duration)
      break
    elsif prompt("Please enter a valid loan duration:")
      loan_duration = gets.chomp
    end
  end
  monthly_pmt = calculation(loan_value, monthly_rate, loan_duration)
  prompt("Calculating...")
  results = <<-MSG
  Your monthly rate is #{monthly_rate * 100}%
  Your monthly payment is $#{monthly_pmt.round(2)}
  MSG
  prompt(results)
end
# exit main loop
prompt("Thank you for using Mortgage Calculator!")
