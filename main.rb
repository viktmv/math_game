require './game'

player1 = Player.new('Johnny')
player2 = Player.new('Amy')

game = MathGame.new(player1, player2)

game.start
