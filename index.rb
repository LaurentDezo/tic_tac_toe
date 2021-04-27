class GameBoard
  def initialize
    @top_left = " "
    @top_center = " "
    @top_right = " "
    @center_left = " "
    @center = " "
    @center_right = " "
    @bottom_left = " "
    @bottom_center = " "
    @bottom_right = " "
  end

  def print_state
    puts board_state
  end

  private 

  attr_accessor :top_left, :top_center, :top_right, :center_left, :center, :center_right, :bottom_left, :bottom_center, :bottom_right

   def board_state
    "   |   |   \n" +
    " #{top_left} | #{top_center} | #{top_right} \n" +
    "___|___|___\n" +
    "   |   |   \n" +
    " #{center_left} | #{center} | #{center_right} \n" +
    "___|___|___\n" +
    "   |   |   \n" +
    " #{bottom_left} | #{bottom_center} | #{bottom_right} \n" +
    "   |   |   "
   end
end

game = GameBoard.new

game.print_state

  