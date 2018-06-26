require_relative 'null_piece'
require_relative 'piece'

class Board
  def initialize 
    create_empty_grid
  end
  
  def create_empty_grid
    @grid = Array.new(8){Array.new(8)}
    8.times do |i|
      8.times do |j|
        @grid[i][j] = NullPiece.new([i,j])
      end
    end
    @grid[7][7] = Piece.new([7,7])
  end
  
  def [](position)
    x,y = position
    @grid[x][y]
  end
  
  def []= (pos, val)
    x, y = pos
    @grid[x][y] = val
  end
  
  def inspect
    "#<Board>"
  end
  
  def move_piece(start_pos, end_pos)
    raise "Start Position is out of bounds" unless Board.within_bound?(start_pos)
    raise "Start Position is empty" if self[start_pos].is_a?(NullPiece)
    raise "End Position is out of bounds" unless Board.within_bound?(end_pos)
    start_piece = self[start_pos]
    end_piece = self[end_pos]
    start_piece.position, end_piece.position = end_piece.position, start_piece.position
    
    self[start_pos] = NullPiece.new(start_pos)
    self[end_pos] = start_piece
    # self[]
  end
  
  def self.within_bound?(position)
    x,y = position
    return true if x < 8 && x > 0 && y < 8 && y > 0
    false
  end
  
  def render 
    result = []
    8.times do |i|
      temp_arr = []
      8.times do |j|
        temp_arr << @grid[i][j].to_s
      end
      result << temp_arr.join(" ")
    end
    puts result
  end
end