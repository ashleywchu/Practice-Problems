# Rock, Paper, Scissors
def rps
	computer_move = ["Rock", "Paper", "Scissors"]
	computer = computer_move.sample

	puts "Rock, Paper, or Scissors?"
	me = gets.chomp
	puts "Your move is #{me}. The computer's move is #{computer}."
	
	if me == computer
		puts "It's a tie!"
	elsif me != computer
		lose = "You lose."
		win = "You win!"
		puts lose if me == "Rock" && computer == "Paper" || me == "Paper" && computer == "Scissors" || me == "Scissors" && computer == "Rock"
		puts win if me == "Rock" && computer == "Scissors" || me == "Paper" && computer == "Rock" || me == "Scissors" && computer == "Paper"
	end
end
