class Board
	TOTAL_POOL_ARR = ["RED","GREEN","BLUE", "YELLOW","BROWN","ORANGE","BLACK","WHITE"]
#	attr_accessor :guesses_left
	def initialize()
		@guesses_left = 12
		@aligned = 0
		@not_aligned = 0
		@code_arr = []
		@guess_arr = Array.new()
		@choice = nil
		@guess_arr = []
	end
	
	def get_total_pool_str
		puts TOTAL_POOL_ARR.join(", ")
	end
	
	def set_color_code()
			@code_arr = TOTAL_POOL_ARR.sample(4)
	end
	
	def set_new_guess()
		4.times { @guess_arr << gets.chomp.upcase }
		# find a way to guarantee and check this
	end
	
	def set_aligneds
		@aligned = 0
		@not_aligned = 0
	end
	
	def check_placement
		@guess_arr[-4..-1].each_with_index do |elmt, idx|
			if @code_arr[idx] == elmt
				@aligned += 1
			elsif @code_arr.include?(elmt)
				@not_aligned += 1
			end
		end
	end
	
	def set_guesses_left
		@guesses_left -= 1
	end
	def get_guesses_left
		@guesses_left
	end

	def get_aligned
		@aligned
	end
	def get_not_aligned
		@not_aligned
	end
	
	def get_board
		get_outcome
		
		puts "#{@aligned} colors aligned."
		puts "#{@not_aligned} colors not aligned."
		puts "Guesser has #{get_guesses_left} guesses left"
	end

##########################################
# make a class referee
	def get_outcome
		puts winner if get_aligned == 4
		loser if get_guesses_left == 0
	end
	def winner
		puts "You win!"
		puts exit_game
	end
	def loser
		puts "You lose!"
		exit_game
	end
	def exit_game
		puts "The winning combination was: \n"
		puts @code_arr.join(", ")
		puts "Thanks for playing"
		puts exit(0)
	end
end
