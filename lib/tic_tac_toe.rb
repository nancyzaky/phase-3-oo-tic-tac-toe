require "pry"
class TicTacToe
  attr_accessor :board, :wons

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [2,5,8],
  [1,4,7],
  [0,3,6],
  [2,4,6],
  [0,4,8]
]
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
    @wons = nil
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end



  def input_to_index(val)
    newval = val.to_i
    newval -=1
    # position_taken?(newval)
   newval
  end
def position_taken?(index)
@board[index] == " " ? false : true
end
  def move(index, symbol)
   @board[index] = symbol
  end
def valid_move?(index)
!position_taken?(index) && index>=0 && index <=9

end


def turn_count
count = 0

@board.each do |item|
  if item != " "
    count +=1
  end
end
count
end


def current_player
  countX = 0
  countY = 0
  result = nil
  @board.each do |item|
    if item == "X"
      countX += 1
    elsif item =='O'
      countY +=1
  end
end
if countX <= countY
result = 'X'
elsif countX > countY
  result = "O"
end

result
end


def turn

  puts "enter a number between 1 - 9"
  result = gets.chomp
 result2 = input_to_index(result)
  if !position_taken?(result2) && valid_move?(result2)
currentMove = current_player
puts currentMove
@board[result2] = currentMove


 else
 self.turn
 end
 display_board
  end

 def full?
  result = nil
  @board.each do |item|
    if item == " "
      result =  false
    else
      result =  true
    end
end
result
end


def won?
allX = []
allO = []
winners = 0
 @board.map.with_index do |item, index|
 if item == 'X'
  allX << index
 elsif item =="O"
  allO << index
end
end
WIN_COMBINATIONS.each do |combo|
 if  allX.include?combo[0] && combo[1] && combo[2]

  winners = combo
 elsif allO.include?combo[0] && combo[1] && combo[2]
  winners = combo
  @wons = "O"
 else winners = false
 end
end
winners

end

def draw?
   full?&& !won?
end
def winner

 @wons

end


def over?
  full? || won?
end


def play
unless over? do turn end

end
 won? ? "congratulations" : 'ended'

end

game = TicTacToe.new()
game.board = ["X", "O", "X", "O", "X", "O", "O", "X", "X"]
game.won?
game.winner
#  binding.pry
