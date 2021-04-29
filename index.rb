require "pry"

def tic_tac_toe
  won = false
  board = Board.new

  until won || Square.all_checked?
    turn(board)
  end
end

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

def won?
end

def draw?
end

class Board
  attr_reader :top_left, :top, :top_right, :center_left, :center, :center_right, :bottom_left, :bottom, :bottom_right,
              :top_row, :center_row, :bottom_row, :left_column, :center_column, :right_column, :left_diagonal, :right_diagonal
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
    @top_row = Combination.new(top_left, top, top_right)
    @center_row = Combination.new(center_left, center, center_right)
    @bottom_row = Combination.new(bottom_left, bottom, bottom_right)
    @left_column = Combination.new(top_left, center_left, bottom_left)
    @center_column = Combination.new(top, center, bottom)
    @right_column = Combination.new(top_right, center_right, bottom_right)
    @left_diagonal = Combination.new(top_left, center, bottom_right)
    @right_diagonal = Combination.new(bottom_left, center, top_right)
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
  attr_reader :content, :row, :column, :checked
  @@instances = []
  @@next_check = "X"
  def initialize(row, column)
    @content = " "
    @row = row
    @column = column
    @checked = false
    @@instances.push(self)
  end

  def check
    self.content=(@@next_check)
    @@next_check == "X" ? @@next_check = "O" : @@next_check = "X"
    self.checked=(true)
  end

  def self.instances
    @@instances
  end

  def self.all_checked? # this doesn't need to be in class, need to refactor
    checked_squares = 0
    draw = false

    self.instances.each do |square|
      checked_squares += 1 unless square.content == " "
    end

    if checked_squares == 9
      draw = true
      puts "This is a draw, play again?"
    end
    draw
  end

  private

  attr_writer :content, :checked
end

class Combination
  attr_reader :squares
  def initialize(square1, square2, square3)
    @squares = [square1, square2, square3]
  end
end

board = Board.new
puts board.top_row.squares