require "pry"
VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts("=> #{message}")
end

choice = ''
computer_choice = ''
loop do
  loop do

    prompt("Choose one: #{VALID_CHOICES.join(", ")}")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end

  end
  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}; Computer chose #{computer_choice}")

  if (choice == "rock" && computer_choice == "scissors") ||
    (choice == "paper" && computer_choice == "rock") ||
    (choice == "scissors" && computer_choice == "paper")
    prompt("You won!")
  elsif (computer_choice == "rock" && choice == "scissors") ||
    (computer_choice == "paper" && choice == "rock") ||
    (computer_choice == "scissors" && choice == "paper")
    prompt("Computer won!")
  else (choice == "rock" && computer_choice == "rock") ||
    (choice == "paper" && computer_choice == "paper") ||
    (choice == "scissors" && computer_choice == "scissors")
    prompt("You tied!")
  end

  prompt('Would you like to play again?')
  play_again = gets.chomp
  break if play_again.downcase.start_with?('n')
end

prompt('Thanks for playing Rock, Paper, Scissors!')
