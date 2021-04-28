require "pry"

class GameBoard
  def initialize
    @top_left = " "
    @top = " "
    @top_right = " "
    @center_left = " "
    @center = " "
    @center_right = " "
    @bottom_left = " "
    @bottom = " "
    @bottom_right = " "
  end

  def print_state
    self.top_left=("X")
    self.center=("O")
    puts board_state
  end

  private 
  attr_accessor :top_left, :top, :top_right, :center_left, :center, :center_right, :bottom_left, :bottom, :bottom_right

   def board_state
    "   |   |   \n" +
    " #{top_left} | #{top} | #{top_right} \n" +
    "___|___|___\n" +
    "   |   |   \n" +
    " #{center_left} | #{center} | #{center_right} \n" +
    "___|___|___\n" +
    "   |   |   \n" +
    " #{bottom_left} | #{bottom} | #{bottom_right} \n" +
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

square = Square.new
puts square.content
square.check
puts square.content

  