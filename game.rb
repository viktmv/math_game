require './question'

class MathGame
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @currentPlayer = player1
  end

  def nextPlayer
    if (@currentPlayer == @player1)
      @currentPlayer = @player2
    else
      @currentPlayer = @player1
    end
  end

  def start
    puts 'Game starts!'

    while (@player1.isAlive? && @player2.isAlive?) &&
          (!@player1.hasWon? && !@player2.hasWon?) do

      puts "*********- NEW TURN -*********"
      puts "Current Player is #{@currentPlayer.name}"

      @question = Question.new
      puts 'What is the result of this expression:'
      puts  "-----> #{@question.description} <------"

      puts "What is your answer?"
      puts '>>'
      @answer = gets.chomp.to_i

      if (@answer == @question.result)
        puts 'Correct!'
        puts "#{@currentPlayer.name} gets 1 point"

        @currentPlayer.points += 1

        if (@currentPlayer.hasWon?)
          puts "#{@currentPlayer.name} wins the game!"
        end

        @currentPlayer = self.nextPlayer
        next
      else
        @currentPlayer.lives -= 1
        puts 'Wrong!'
        puts "#{@currentPlayer.name} loses 1 life"

        if (!@currentPlayer.isAlive?)
          puts "#{@currentPlayer.name} has lost the game!"
          puts "******---GAME OVER---******"
        end

        @currentPlayer = self.nextPlayer
      end
    end
  end
end
