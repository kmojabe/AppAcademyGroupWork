require_relative 'piece'

module SlidingPiece
  
  def moves
    result = []
    if move_dirs.include?(:horiz)
      result += horizontal_dirs
    elsif move_dirs.include?(:diag)
      result += diagonal_dirs
    end
    # p result
    result 
  end
  
  def horizontal_dirs
    result = []
    my_position = self.position
    #iterate this down board
    curr_position = [ my_position[0] , my_position[1] + 1 ]
    while Board.within_bound?(curr_position) && @board[curr_position].is_a?(NullPiece)
      result << curr_position
      curr_position = [ curr_position[0] , curr_position[1] + 1 ]
    end
    #iterate up board
    curr_position = [ my_position[0] , my_position[1] - 1 ]
    while Board.within_bound?(curr_position) && @board[curr_position].is_a?(NullPiece)
      result << curr_position
      curr_position = [ curr_position[0] , curr_position[1] - 1 ]
    end
    
    curr_position = [ my_position[0] + 1, my_position[1] ]
    while Board.within_bound?(curr_position) && @board[curr_position].is_a?(NullPiece)
      result << curr_position
      curr_position = [ curr_position[0] + 1 , curr_position[1] ]
    end
    
    curr_position = [ my_position[0] - 1 , my_position[1] ]
    while Board.within_bound?(curr_position) && @board[curr_position].is_a?(NullPiece)
      result << curr_position
      curr_position = [ curr_position[0] - 1 , curr_position[1] ]
    end
    
    return result
  end
  
  
  def diagonal_dirs
    result = []
    my_position = self.position
    #iterate this down board
    curr_position = [ my_position[0] + 1 , my_position[1] + 1 ]
    while Board.within_bound?(curr_position) && @board[curr_position].is_a?(NullPiece)
      result << curr_position
      curr_position = [ curr_position[0] + 1 , curr_position[1] + 1 ]
    end
    #iterate up board
    curr_position = [ my_position[0] -1, my_position[1] - 1 ]
    while Board.within_bound?(curr_position) && @board[curr_position].is_a?(NullPiece)
      result << curr_position
      curr_position = [ curr_position[0] - 1, curr_position[1] - 1 ]
    end
    
    curr_position = [ my_position[0] + 1, my_position[1] -1]
    while Board.within_bound?(curr_position) && @board[curr_position].is_a?(NullPiece)
      result << curr_position
      curr_position = [ curr_position[0] + 1 , curr_position[1] -1 ]
    end
    
    curr_position = [ my_position[0] - 1 , my_position[1] + 1]
    while Board.within_bound?(curr_position) && @board[curr_position].is_a?(NullPiece)
      result << curr_position
      curr_position = [ curr_position[0] - 1 , curr_position[1] + 1 ]
    end
    result
  end
  
  def move_dirs
    [:horiz,:diag]
  end
  
  
end

class Rook < Piece
  include SlidingPiece
  
  def symbol
    "♖"
  end
  def move_dirs
    [:horiz]
  end
end

class Bishop < Piece
  include SlidingPiece
  
  def symbol
    "♗"
  end
  def move_dirs
    [:diag]
  end
end

class Queen < Piece
  include SlidingPiece
  def symbol
    "♕"
  end
  def move_dirs
    [:diag,:horiz]
  end
end





