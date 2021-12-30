require "pry"
VALID_CHOICES = %w(rock paper scissors)
choice = ''
computer_choice = ''

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  elsif prompt("You tied!")
  end
end

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end
  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}; Computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  prompt('Would you like to play again?')
  play_again = gets.chomp
  break if play_again.downcase.start_with?('n')
end

prompt('Thanks for playing Rock, Paper, Scissors!')
