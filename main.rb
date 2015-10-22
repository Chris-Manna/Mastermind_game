require_relative "board.rb"

def main_method
	a = Board.new()
	puts a.get_total_pool_str()
	puts a.set_color_code
	puts "Input new guess: "
	a.set_new_guess
	a.check_placement
end

main_method
