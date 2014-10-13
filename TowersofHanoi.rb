# Towers of Hanoi

pegs = { "a" => [3, 2, 1],
		 "b" => [],
		 "c" => []
}

# Method to display pegs
def display_pegs
	puts "Peg A = " + pegs["a"].to_s
	puts "Peg B = " + pegs["b"].to_s
	puts "Peg C = " + pegs["c"].to_s
	puts
end
# Method to perform user move
def user_move(from, to)
	# If FROM peg is empty, there is no disk to move. Display error 
	# message.
	if pegs[from].count == 0
		puts "That peg is empty, please choose a different peg!"
	# If the disk the user is trying to move is larger than the disk on 
	# the TO peg, don't allow the move. Display invalid move message.
	elsif (pegs[to].count != 0) && (pegs[from].last > pegs[to].last)
		puts "That is an invalid move. Please try again."
	# If move is valid, pop FROM peg and push disk to the TO peg.
	else
		pegs[to] << pegs[from].pop
	end
end

def hanoi
	display_pegs
	def initialize
		win = false
	end

	while !win
		puts "Which peg would you like to move a disk from?"
		from = gets.chomp.downcase
		puts "Which peg would you like to move a disk to?"
		to = gets.chomp.downcase

		puts user_move(from, to)
		puts display_pegs
		if pegs["c"] == [3, 2, 1]
			win = true
			puts "Congratulations, you won!"
			puts
		end
	end
end