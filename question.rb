class Question
  attr_reader :result, :description

  def initialize
    @@operands = [ '+', '-', '*', '/']
    i = rand(1...5)
    num1 = rand(41)
    num2 = rand(1...11)

    case i
    when 1
      @result = num1 + num2
    when 2
      @result = num1 - num2
    when 3
      @result = num1 * num2
    when 4
      @result = num1 / num2
    end
    @description = "#{num1} #{@@operands[i-1]} #{num2}"
  end
end
