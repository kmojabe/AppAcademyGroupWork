require_relative 'Pieces/null_piece'
require_relative 'Pieces/piece'

class Board
  attr_reader :grid
  def initialize 
    create_empty_grid
  end
  
  def create_empty_grid
    @grid = Array.new(8){Array.new(8)}
    (1..6).each do |i|
      8.times do |j|
        @grid[i][j] = NullPiece.instance
      end
    end
    @grid[0][0] = Rook.new(:yellow, self, [0,0])
    @grid[0][7] = Rook.new(:yellow, self, [0,7])
    @grid[0][1] = Knight.new(:yellow, self, [0,1])
    @grid[0][6] = Knight.new(:yellow, self, [0,6])
    @grid[0][2] = Bishop.new(:yellow, self, [0,2])
    @grid[0][5] = Bishop.new(:yellow, self, [0,5])
    @grid[0][3] = Queen.new(:yellow, self, [0,3])
    @grid[0][4] = King.new(:yellow, self, [0,4])
    
    @grid[7][7] = Rook.new(:red, self, [7,7])
    @grid[7][0] = Rook.new(:red, self, [7,0])
    @grid[7][1] = Knight.new(:red, self, [7,1])
    @grid[7][6] = Knight.new(:red, self, [7,6])
    @grid[7][2] = Bishop.new(:red, self, [7,2])
    @grid[7][5] = Bishop.new(:red, self, [7,5])
    @grid[7][3] = King.new(:red, self, [7,3])
    @grid[7][4] = Queen.new(:red, self, [7,4])

  end
  
  def [](position,pos2 = nil)
    x,y = position,pos2 unless pos2.nil?
    x,y = position if pos2==nil 
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
    # raise "Start Position is out of bounds" unless Board.within_bound?(start_pos)
    # raise "Start Position is empty" if self[start_pos].is_a?(NullPiece)
    # raise "End Position is out of bounds" unless Board.within_bound?(end_pos)
    valid_move?(start_pos, end_pos)
    start_piece = self[start_pos]
    # end_piece = self[end_pos]
    start_piece.position = end_pos
    
    self[start_pos] = NullPiece.instance
    self[end_pos] = start_piece
    
    # self[]
  end
  
  def self.within_bound?(position)
    x,y = position
    return true if x < 8 && x >= 0 && y < 8 && y >= 0
    false
  end
  def valid_move?(start_pos, end_pos)
    raise "Start Position is out of bounds" unless Board.within_bound?(start_pos)
    raise "Start Position is empty" if self[start_pos].is_a?(NullPiece)
    raise "End Position is out of bounds" unless Board.within_bound?(end_pos)
  end

end