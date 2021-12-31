class Board
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    self.show
  end

  def show
    puts "   a   b   c "
    @board.each_with_index do |row, index|
      puts (index+1).to_s + '  ' + row.join(' | ')
      puts '  ' + Array.new(3,'---').join('+')  unless index == 2
    end
    puts
  end

  def add_move(move, char)
    column, row = parse_move(move)
    @board[row][column] = char
    self.show
  end

  private
  def parse_move(move)
    [move[0].ord - 'a'.ord, move[1].to_i - 1]
  end
end
