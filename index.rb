require "pry"

def turn
  puts "On what row would you like to play? (top, center or bottom)"
  row = gets.chomp
  puts "On what column would you like to play? (left, center or right)"
  column = gets.chomp
  puts row
  puts column
end

class Board
  attr_reader :top_left, :top, :top_right, :center_left, :center, :center_right, :bottom_left, :bottom, :bottom_right
  def initialize
    @top_left = Square.new
    @top = Square.new
    @top_right = Square.new
    @center_left = Square.new
    @center = Square.new
    @center_right = Square.new
    @bottom_left = Square.new
    @bottom = Square.new
    @bottom_right = Square.new
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
  attr_reader :content
  def initialize
    @content = " " 
  end

  def check
    self.content=("X")
  end

  private
  attr_writer :content
end

turn()