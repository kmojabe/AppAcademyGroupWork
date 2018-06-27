require_relative 'board'
require_relative 'cursor'
require 'colorize'


require_relative "Pieces/piece"
require_relative "Pieces/null_piece"
require_relative "Pieces/sliding_piece"
require_relative "Pieces/stepping_piece"





class Display
  attr_reader :cursor #need to remove 
  def initialize(board=Board.new())
    @board = board
    @cursor = Cursor.new([0,0],@board)
  end
  
  def render 
    system("clear")
    result = []
    result << "  0 1 2 3 4 5 6 7"
    8.times do |i|
      temp_arr = [i]
      8.times do |j|
        temp_arr << coloring([i,j])
      end
      result << temp_arr.join(" ")
    end
    puts result
  end
  
  def coloring(location)
    piece = @board[location]
    if location == @cursor.cursor_pos
      return piece.to_s.colorize(:light_green)
    end
    piece.to_s
  end
  
  def play
    loop do
      self.render
      p @board[0,1].moves
      cursor.get_input
    end
  end
  
end


if $PROGRAM_NAME == __FILE__
  d = Display.new
  d.play
end