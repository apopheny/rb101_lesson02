# Build a command line calculator program that does the following:

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

Kernel.puts("Welcome to Calculator!")

Kernel.puts("What is the first number?")
num1 = Kernel.gets().chomp().to_i()
Kernel.puts("What is the second number?")
num2 = Kernel.gets().chomp().to_i()

Kernel.puts("Would you like to (1) add,(2) subtract, (3) multiply, or (4) divide?")
operand = Kernel.gets().chomp().downcase()

if operand == "1" || operand == "add"
    result = num1 + num2
elsif operand == "2" || operand == "subtract"
    result = num1 - num2
elsif operand == "3" || operand == "multiply"
    result = num1 * num2
elsif operand == "4" || operand == "divide"
    result = num1.to_f / num2.to_f
else puts "That is not a valid operation"
end

Kernel.puts("The result is #{result}")