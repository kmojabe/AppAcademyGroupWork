require_relative 'piece'
require 'singleton'
class NullPiece < Piece
  include Singleton
  attr_accessor :position 
  def initialize
  end
  def to_s
    
    "_"
  end
end