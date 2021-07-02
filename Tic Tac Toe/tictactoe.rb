module Board
  @@positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def current_board
    puts(<<-EOT)
          #{@@positions[0]} | #{@@positions[1]} | #{@@positions[2]}
        -------------
          #{@@positions[3]} | #{@@positions[4]} | #{@@positions[5]}
        -------------
          #{@@positions[6]} | #{@@positions[7]} | #{@@positions[8]}
    EOT
  end

  def firstmove
    puts current_board
    puts "HEY #{name} LOOK ABOVE AND CHOOSE A NUMBER, WHERE YOU WANT TO PLACE YOUR MARKER"
    play = gets.chop.to_i
    until play == @@positions[play - 1]
      puts 'INVALID PLAY, DO IT AGAIN'
      play = gets.chop.to_i
    end
    @@positions[play - 1] = marker
    puts current_board
  end

  def keeponplaying
    if @@positions == [1, 2, 3, 4, 5, 6, 7, 8, 9]
      # #END
    else
      puts "HEY #{name} NOW IS YOUR TURN TO PLAY, CHOOSE WHERE YOU PLACE YOUR MARKER"
      play = gets.chop.to_i
      until play == @@positions[play - 1]
        puts 'INVALID PLAY, DO IT AGAIN'
        play = gets.chop.to_i
      end
      @@positions[play - 1] = marker
      puts current_board
      checkwinner
      tie
    end
  end

  def checkwinner
    if @@positions[0] == 'X' && @@positions[1] == 'X' && @@positions[2] == 'X' || @@positions[0] == 'O' && @@positions[1] == 'O' && @@positions[2] == 'O'
      puts "#{name} YOU ARE THE WINNER!"
      resetboard; askforplay
    elsif @@positions[3] == 'X' && @@positions[4] == 'X' && @@positions[5] == 'X' || @@positions[3] == 'O' && @@positions[4] == 'O' && @@positions[5] == 'O'
      puts "#{name} YOU ARE THE WINNER!"
      resetboard; askforplay
    elsif @@positions[6] == 'X' && @@positions[7] == 'X' && @@positions[8] == 'X' || @@positions[6] == 'O' && @@positions[7] == 'O' && @@positions[8] == 'O'
      puts "#{name} YOU ARE THE WINNER!"
      resetboard; askforplay
    elsif @@positions[0] == 'X' && @@positions[4] == 'X' && @@positions[8] == 'X' || @@positions[0] == 'O' && @@positions[4] == 'O' && @@positions[8] == 'O'
      puts "#{name} YOU ARE THE WINNER!"
      resetboard; askforplay
    elsif @@positions[6] == 'X' && @@positions[4] == 'X' && @@positions[2] == 'X' || @@positions[6] == 'O' && @@positions[4] == 'O' && @@positions[2] == 'O'
      puts "#{name} YOU ARE THE WINNER!"
      resetboard; askforplay
    elsif @@positions[0] == 'X' && @@positions[3] == 'X' && @@positions[6] == 'X' || @@positions[0] == 'O' && @@positions[3] == 'O' && @@positions[6] == 'O'
      puts "#{name} YOU ARE THE WINNER!"
      resetboard; askforplay
    elsif @@positions[1] == 'X' && @@positions[4] == 'X' && @@positions[7] == 'X' || @@positions[1] == 'O' && @@positions[4] == 'O' && @@positions[7] == 'O'
      puts "#{name} YOU ARE THE WINNER!"
      resetboard; askforplay
    elsif @@positions[2] == 'X' && @@positions[5] == 'X' && @@positions[8] == 'X' || @@positions[2] == 'O' && @@positions[5] == 'O' && @@positions[8] == 'O'
      puts "#{name} YOU ARE THE WINNER!"
      resetboard; askforplay
    end
  end

  def tie
    if @@positions.any?(Integer)
    else
      puts 'IS A FUCKING TIE'
      resetboard; askforplay
    end
  end

  def resetboard
    @@positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end

class Player
  include Board

  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class NewGame < Player
  attr_reader :name, :marker

  def initialize
    @name = getplayer1name
    @marker = getplayer1marker
    @name2 = getplayer2name
    @marker2 = getplayer2marker
  end

  def getplayer1name
    puts 'Hey pal, what is your name?'
    name = gets.chop
    puts 'You will play with a random marker between X and O'
    name
  end

  def getplayer1marker
    random = rand(10)
    marker = random.even? ? 'X' : 'O'
    sleep(2)
    puts 'Beep beep'
    sleep(2)
    puts 'Tossing a coin for you'
    sleep(2)
    puts "Your marker is #{marker}"
    sleep(2)
    if marker == 'X'
      puts 'You play first'
    else
      puts 'You play in second'
    end
    marker
  end

  def getplayer2name
    sleep(2)
    puts 'Alright, so the name of the other pal is?'
    gets.chop
  end

  def getplayer2marker
    sleep(2)
    if @marker == 'O'
      marker2 = 'X'
      puts "Because #{@name} is playing with #{@marker}, you will be #{marker2} and go first!"
    else
      marker2 = 'O'
      puts "Because #{@name} is playing with #{@marker}, you will be #{marker2} and go in second"
    end
    marker2
  end

  def play
    player1 = Player.new(@name, @marker)
    player2 = Player.new(@name2, @marker2)

    if player1.marker == 'X'
      player1.firstmove
      player2.keeponplaying
      player1.keeponplaying
      player2.keeponplaying
      player1.keeponplaying
      player2.keeponplaying
      player1.keeponplaying
      player2.keeponplaying
      player1.keeponplaying
    else
      player2.firstmove
      player1.keeponplaying
      player2.keeponplaying
      player1.keeponplaying
      player2.keeponplaying
      player1.keeponplaying
      player2.keeponplaying
      player2.keeponplaying
      player1.keeponplaying
    end
  end
end

def askforplay
  puts 'You Wanna play again? (Y/N)'
  ans = gets.chop
  case ans
  when 'Y', 'y'
    NewGame.new.play
  when 'N', 'n'
    puts 'Thanks for playing'
  else
    puts 'INVALID ANSWER'
    askforplay
  end
end
NewGame.new.play