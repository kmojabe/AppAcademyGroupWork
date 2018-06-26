require_relative 'piece'
class NullPiece < Piece
  attr_accessor :position 
  def to_s
    "_"
  end
end