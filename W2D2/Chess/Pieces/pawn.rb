require_relative 'piece'

class Pawn < Piece
  # def moves
  #   results = []
  #   row = self.position[0]
  #   if row == 1
  #     results << [row,self.position[1]+1] 
  #     results << [row,self.position[1]+2]
  #   elsif row == 6
  # 
  #   end
  # end
  def moves
    results = []
    row = self.position[0]
    if row == 1 && row == 6
      results << [row,self.position[1]+@direction] 
      results << [row,self.position[1]+2*@direction]
    else
      results << [row,self.position[1]+@direction] 
    end
  end
  
  def initialize(color, board, pos)
    super(color, board, pos)
    set_direction
  end
  
  def set_direction
    row = self.position[0]
    if row == 1
      @direction = 1
    else
      @direction = -1
    end
  end
  
end