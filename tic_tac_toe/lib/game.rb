require_relative 'tic_tac_toe'

class Game
  attr_reader :board, :players

  Player = Struct.new(:name, :char)

  def initialize
    @board = Board.new
    @players = [
      Player.new('Player 1', 'x'),
      Player.new('Player 2', 'o')
    ]
  end

  def play
    loop do
      board.show
      turn(board, players.first)
      break if board.gameover?

      players.rotate!
    end
    board.show
    game_over
  end

  def game_over
    puts "GAME OVER"
    if board.winner == 'tie'
      puts "It's a tie"
    else
      puts "Winner: #{players.first.name}"
    end
  end

  def turn(board, player)
    loop do
      move = player_input(player)
      if board.valid_move? move
        board.add_move(move, player.char)
        break
      else
        print "Invalid move, try again\n"
      end
    end
  end

  def player_input(player)
    print "#{player.name} (#{player.char}), enter your move: "
    gets.chomp
  end
end
