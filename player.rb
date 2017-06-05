class Player
  attr_accessor :lives, :score, :points
  attr_reader :name

  def initialize(name)
    @lives = 3
    @points = 0
    @name = name
  end

  def isAlive?
    @lives <= 0 ? false : true
  end

  def hasWon?
    @points >= 3 ? true : false
  end
end
