class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end  

  def display_board

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "


  end



  def turn_count
    counter = 0
    @board.each { |x| counter += 1 if x != " " }
    counter
  end

  def current_player

    counter = turn_count
    return "X" if counter == 0
    if (counter + 1) % 2 == 0
      "O"
    else
      "X"
    end

  end

  # Helper Method
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # Define your WIN_COMBINATIONS constant

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

  def won?
    arrayX = []
    arrayO = []
    i = 0
    while i < @board.length
      if @board[i] == "X"
        arrayX << i
      elsif @board[i] == "O"
        arrayO << i
      end


      i += 1
    end

    return false if @board.all? {|x| x == " " }
    WIN_COMBINATIONS.each { |comb| return comb if comb.all? { |x| arrayX.include?(x) }}
    WIN_COMBINATIONS.each { |comb| return comb if comb.all? { |x| arrayO.include?(x) }}

    false

  end

  def full?
    if @board.any? {|x| x == " "}
      false
    elsif  won? == false && !@board.any? {|x| x == " " }
      true
    end

  end

  def draw?
      if full? == true && won? == false
        true
      else
        false
      end
  end

  def over?
      return true if full?
      return true if won? != false
      return true if draw? == true
      false
  end

  def winner
    return @board[won?[0]] if won? != false
    nil

  end


  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end



  # Define your play method below

  def play
     until over? == true
       turn
      break if won? != false

     end
     puts "Congratulations #{winner}!" if won? != false
     puts "Cat's Game!" if draw? == true
  end

  def turn
        while true
          puts "Please enter 1-9:"
          input = gets.strip
          index = input_to_index(input)
          break if valid_move?(index)
        end
        move(index, value = current_player)
        display_board

  end
end  
