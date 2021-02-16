class Board
    attr_accessor :board
  
    def initialize
      @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
  
    def display_board
      puts "#{board[0]} | #{board[1]} | #{board[2]}\n---------\n#{board[3]} | #{board[4]} | #{board[5]}\n---------
      \n#{board[6]} | #{board[7]} | #{board[8]}"
    end
  end
  
  class Player
    attr_reader :name, :sign
    attr_accessor :record
  
    def initialize(name, sign)
      @name = name
      @sign = sign
      @record = []
    end
  end
  
  def win_check(win_combination, player_record)
    win_combination.each do |win|
      win.all? { |win1| player_record.include?(win1) }
    end
  end
  
  puts 'Player 1 please input your name'
  name = gets.strip
  token = 'X'
  Player_1 = Player.new(name, token)
  puts 'Player 2 please input your name'
  name = gets.strip
  token = 'O'
  Player_2 = Player.new(name, token)
  game_board = Board.new
  count = 1
  game_on = true
  while game_on
    puts game_board.display_board
    current_player = if count.odd?
                       Player_1
                     else
                       Player_2
                     end
    puts "#{current_player.name} it is your turn, please make your move"
    move = gets.strip
    gamecheck = game_board.board[move.to_i - 1]
    puts 'Move is not valid, Make a valid move' unless move.to_i == gamecheck
    current_player.record << move.to_i
    game_board.board[move.to_i - 1] = current_player.sign
    count += 1
    if count == 10
      puts 'The game is a draw'
      break
    end
  end