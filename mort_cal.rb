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


=begin
TOP
start
variables: 
initialize monthly_pmt (monthly payment)
initialize loan_total (loan total)
initialize monthly_rate (monthly rate)
initialize name (user name)
initialize loan_value (amount lent)
initialize apr (annual percentage rate)
initialize loan_duration (length of loan in months)

welcome
get name
*NAME VALIDATION validate that name is not empty
save name to VAR name
greet with VAR name
START LOOP
ask if they want to perform a mortgage calculation
IF "no" exit
	ELSE continue
get loan amount
INTEGER VALIDATION validate that loan amount is an integer
save loan amount to VAR loan_value
get apr as an integer
INTEGER VALIDATION validate that loan amount is an integer
save apr to VAR apr
*MONTHLY INTEREST RATE CALCULATION convert apr to monthly interest rate
save monthly interest rate to VAR monthly_rate
get loan duration in months as an integer
*INTEGER VALIDATION validate that loan durationis an integer
save monthly payment to VAR loan_duration

*CALCULATION perform calculation
display VAR monthly_rate (monthly interest rate (solved))
display VAR loan_duration (loan duration in months (solved))
display VAR monthly_payment (monthly payment (solved))
END LOOP
say goodbye with name
exit

NAME VALIDATION
loop
is name empty?
yes, prompt for name again
no, return true and break
end loop

Y/N VALIDATION
LOOP
does entry.downcase begin with y || n?
yes: true
	break
no: re-prompt for response
END LOOP


MONTHLY INTEREST RATE CALCULATION
monthly_rate = apr / 12
END

INTEGER VALIDATION
loop
is int equal to int.to_i.to_s?
no, prompt for number entry
yes, return true and break
end loop

CALCULATION
monthly_pmt = loan.to_f * (monthly_rate.to_f / (1 - (1 + monthly_rate.to_f)**(-loan_duration.to_i)))
=end