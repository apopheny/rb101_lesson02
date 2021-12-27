# Suppose we're building a scientific calculator, and we now need to account for inputs that include decimals. How can we build a validating method, called number?, to verify that only valid numbers -- integers or floats -- are entered?

require "pry"
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(entry)
  original = entry
  entry = entry.to_i.to_s
  entry_float = original.to_f.to_s
  # binding.pry
  entry == original || entry_float == original
end

def operation_to_message(operation)
  case operation
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end
prompt("Welcome to Calculator! Enter your name:")
name = nil

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt('Make sure to use a valid name.')
  else break
  end
end
prompt("Hi #{name.capitalize}!")

num1 = nil
num2 = nil
operand = nil
result = nil

loop do
  prompt('What is the first number?')
  loop do
    num1 = Kernel.gets().chomp()
    if valid_number?(num1)
      break
    else prompt("Hmmm... That doesn't seem to be a valid entry")
    end
  end
  loop do
    prompt("What is the second number?")
    num2 = Kernel.gets().chomp()
    if valid_number?(num2)
      break
    else prompt("Hmmm... That doesn't seem to be a valid entry")
    end
  end

  operator_prompt = <<-MSG
  Would you like to: 
  (1) add
  (2) subtract
  (3) multiply
  (4) divide?
  MSG

  prompt(operator_prompt)
  loop do
    operand = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operand)
      break
    else
      prompt('Must choose 1, 2, 3, or 4')
    end
  end

  prompt("#{operation_to_message(operand)} the two numbers...")

  result =  case operand
            when '1'
              result = num1.to_i + num2.to_i
            when '2'
              result = num1.to_i - num2.to_i
            when '3'
              result = num1.to_i * num2.to_i
            when '4'
              result = num1.to_f / num2.to_f
            end

  prompt("The result is #{result}")
  prompt('Would you like to perform another calculation? (Y/N)')
  response = gets().chomp()
  break unless response.downcase().start_with?('y')
end

prompt('Thank you for using the calcular. Bye now!')
