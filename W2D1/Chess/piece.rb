class Piece
  attr_accessor :position 
  def initialize(pos)
    @position = pos
    
  end
  def to_s
    return "+"
  end
end