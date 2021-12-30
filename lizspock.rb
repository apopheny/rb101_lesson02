require "pry"
VALID_CHOICES = %w(rock paper scissors lizard spock)
choice = ''
computer_choice = ''

def prompt(message)
  puts("=> #{message}")
end

def short_input(shortstring)
  if shortstring.downcase.start_with?('r')
    "rock"
  elsif shortstring.downcase.start_with?('p')
    "paper"
  elsif shortstring.downcase.start_with?('sc')
    "scissors"
  elsif shortstring.downcase.start_with?('l')
    "lizard"
  elsif shortstring.downcase.start_with?('sp')
    "spock"
  end
end

def rockwin?(other)
  other == "lizard" || other == "scissors"
end

def paperwin?(other)
  other == "rock" || other == "spock"
end

def scissorswin?(other)
  other == "paper" || other == "lizard"
end

def lizardwin?(other)
  other == "spock" || other == "paper"
end

def spockwin?(other)
  other == "rock" || other == "scissors"
end

def win?(first, second)
  if first == "rock" && second != "rock"
    rockwin?(second)
  elsif first == "paper" && second != "paper"
    paperwin?(second)
  elsif first == "scissors" && second != "scissors"
    scissorswin?(second)
  elsif first == "lizard" && second != "lizard"
    lizardwin?(second)
  elsif first == "spock" && second != "spock"
    spockwin?(second)
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  elsif prompt("You tied!")
  end
end
compwins = 0
playerwins = 0

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}. You may type 'r' for 'rock', 'sc' for 'scissors', etc.")
    choice = gets.chomp
    choice = short_input(choice)
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end
  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}; Computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    playerwins += 1
  elsif win?(computer_choice, choice)
    compwins += 1
  end

  prompt("You have won #{playerwins} games; computer has won #{compwins} games")

  if playerwins == 3
    prompt("You have won the set!")
  elsif compwins == 3
    prompt("The computer has won the set!")
  end

  if playerwins == 3 || compwins == 3
    playerwins = 0
    compwins = 0
    prompt('Would you like to play again?')
    play_again = gets.chomp
    break if play_again.downcase.start_with?('n')
  end
end

prompt('Thanks for playing Rock, Paper, Scissors!')
