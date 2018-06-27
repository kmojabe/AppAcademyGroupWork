require_relative 'piece'

module SteppingPiece
  
  KING_MOVES = [
    [0,1],[0,-1],[1,0],[-1,0],
    [1,1],[1,-1],[-1,1],[-1,-1]
  ]
  KNIGHT_MOVES = [
    [1,2],[1,-2],[-1,2],[-1,-2],
    [2,1],[2,-1],[-2,1],[-2,-1]
  ]
  
  def moves
    if move_dirs.include?(:king)
      return king_moves
    elsif move_dirs.include?(:knight)
      return knight_moves
    end 
  end
  
  def king_moves
    curr_position = self.position
    possible_moves = KING_MOVES.map { |move| [move[0]+curr_position[0],move[1]+curr_position[1]]  }
    possible_moves.select { |move| Board.within_bound?(move) && @board[move].is_a?(NullPiece)  }
  end
  def knight_moves
    curr_position = self.position
    possible_moves = KNIGHT_MOVES.map { |move| [move[0]+curr_position[0],move[1]+curr_position[1]]  }
    possible_moves.select { |move| Board.within_bound?(move) && @board[move].is_a?(NullPiece)  }
  end
  
  def move_dirs
    [:king,:knight]
  end
end

class King < Piece
  include SteppingPiece
  def move_dirs
    [:king]
  end
  def symbol
    "♔"
  end
end
class Knight < Piece
  include SteppingPiece
  def move_dirs
    [:knight]
  end
  def symbol
    "♘"
  end
end


