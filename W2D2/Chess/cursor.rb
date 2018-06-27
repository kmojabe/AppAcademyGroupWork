require "io/console"

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
  end

  def get_input
    # loop do 
    key = KEYMAP[read_char] 
    handle_key(key)
  # end
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)
    return input
  end

  def handle_key(key)
    # p key.to_sym
    # p MOVES.keys.include?(key.to_sym)
    #case key
    if MOVES.keys.include?(key.to_sym)
      update_pos(MOVES[key])# MOVES[key.to_sym]
      return nil
    elsif key == :space || key == :return 
      p cursor_pos
      return @cursor_pos
    elsif key == :ctrl_c
      Process.exit(0)
      # SystemExit.new
    end
    
  end

  def update_pos(diff)
    # p valid_move?(diff)
    if valid_move?(diff)
      @cursor_pos[0] += diff[0]
      @cursor_pos[1] += diff[1]
    end
  end
  
  def valid_move?(diff)
    # p diff
    x,y = diff
    updated_x = cursor_pos[0] + x
    updated_y = cursor_pos[1] + y
    
    
    if updated_x >= 0 && updated_x < 8 && updated_y >= 0 && updated_y < 8
      return true
    end 
    false
  end
  
end
