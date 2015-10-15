class Board
	TOTAL_POOL_ARR = ["RED","GREEN","BLUE", "YELLOW","BROWN","ORANGE","BLACK","WHITE"]
	def initialize()
		@guesses_left = 12
		@aligned = 0
		@not_aligned = 0
		@code_arr = []
		@guess_arr = Array.new()
		@choice
		@guess_arr = []
		
	end
	def get_player_choice(choice)
		@choice = choice
		#come back to this
		# 1 Code Breaker
		# 2 Code Maker
	end
	
	def get_total_pool_str()
		@TOTAL_POOL_ARR.join(", ")
	end
	
	def set_color_code()
		if player_choice == 1
			code_arr = @TOTAL_POOL_ARR.sample(4)
		else
			# find a way to prompt user for the four colors
			# he wants in his code_arr variable in the case
			# he is code maker
			code_arr = Arraynew(4,gets.chomp)
		end
	end
	
	def get_new_guess
		@guess_arr << gets.chomp * 4
	end
	
	def set_placement
		@guess_arr.each_with_index do |elmt, idx|
			if code_arr[idx] == elmt
				@aligned += 1
			elsif code_arr.include?(elmt)
				not_aligned += 1
			end
		end
		set_guesses_left
	end
	def set_guesses_left
		@guesses_left -= 1
	end
	
	def get_guesses_left
		@guesses_left
	end
	def get_aligned
		@aligned
	def get_not_aligned
		@not_aligned
	end
	def get_board
		puts "#{@get_aligned} colors properly lined up."
		puts "#{get_not_aligned} colors not aligned but do exist in coded array."
		puts "Guesser has #{get_guesses_left}"
		get_guesses
	end
	def get_guesses
		puts "here are your guesses"
		guess_arr.each_with_index do |elmt, idx|
			print idx % 4 == 0? "\n#{elmt}" : elmt 
		end
		get_outcome
	end
	def get_outcome
		winner if get_aligned == 4
		loser if get_guesses_left == 0
	end
	def winner
		puts "You win!"
		exit_game
	end
	def loser
		puts "You lose!"
		exit_game
	end
	def exit_game
		puts "Thanks for playing"
		exit(0)
	end
end
