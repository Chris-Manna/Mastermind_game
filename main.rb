require_relative "board.rb"

def main_method
	# open path
	a = Board.new() #	reset_guesses = 12 # new round of games
	
	# show options
	a.get_total_pool_str
	#computer sets color code
	puts a.set_color_code # and show it

	# prompts user for guess
	until a.get_guesses_left <= 0 # || a.get_aligned == 4 # || input == 'q'
		puts "Input new guess: "
		a.set_aligneds
		a.get_total_pool_str
		a.set_new_guess

		a.check_placement
		a.set_guesses_left
		a.get_board
	end
end

main_method
