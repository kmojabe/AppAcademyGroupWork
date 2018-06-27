require_relative '../board'
require 'colorize'


class Piece
  attr_accessor :position 
  def initialize(color, board, pos)
    @color = color
    @board = board
    @position = pos
  end
  
  def to_s
    sym = symbol
    sym.colorize(@color)
  end
  
  def empty?
    
  end
  
  def valid_move?
    
  end
  
  def symbol
    "+"
  end
  
  def self.move_into_check?(end_pos)
    
  end
end