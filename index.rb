require "pry"

def turn(board) # Temporary board argument
  puts "On what row would you like to play? (top, center or bottom)"
  row = gets.chomp.downcase
  puts "On what column would you like to play? (left, center or right)"
  column = gets.chomp.downcase
  validate(row, column)
  board.print_state # Temporary print mechanism
end

def validate(row, column)
  valid = false
  Square.instances.each do |square|
    if square.row == row && square.column == column
      square.check
      valid = true
      break
    end
  end
  puts "Error: inputs do not match, try again" unless valid
end

class Board
  attr_reader :top_left, :top, :top_right, :center_left, :center, :center_right, :bottom_left, :bottom, :bottom_right
  def initialize
    @top_left = Square.new("top", "left")
    @top = Square.new("top", "center")
    @top_right = Square.new("top", "right")
    @center_left = Square.new("center", "left")
    @center = Square.new("center", "center")
    @center_right = Square.new("center", "right")
    @bottom_left = Square.new("bottom", "left")
    @bottom = Square.new("bottom", "center")
    @bottom_right = Square.new("bottom", "right")
  end

  def print_state
    puts board_state
  end

  private

   def board_state
    "   |   |   \n" +
    " #{top_left.content} | #{top.content} | #{top_right.content} \n" +
    "___|___|___\n" +
    "   |   |   \n" +
    " #{center_left.content} | #{center.content} | #{center_right.content} \n" +
    "___|___|___\n" +
    "   |   |   \n" +
    " #{bottom_left.content} | #{bottom.content} | #{bottom_right.content} \n" +
    "   |   |   "
   end
end

class Square
  attr_reader :content, :row, :column
  @@instances = []
  @@check_sign = "X"
  def initialize(row, column)
    @content = " "
    @row = row
    @column = column
    @@instances.push(self)
  end

  def check
    self.content=(@@check_sign)
    @@check_sign == "X" ? @@check_sign = "O" : @@check_sign = "X"
  end

  def self.instances
    @@instances
  end

  private

  attr_writer :content
end

board = Board.new
turn(board)
turn(board)
turn(board)
turn(board)
turn(board)
turn(board)