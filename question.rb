class Question 
  def operators 
    ['+', '-', '*']
  end
  def initialize
    @var1 = rand(11)
    @var2 = rand(11)
    @operator = operators[rand(3)]
    m = var1.method(operator)
    @answer = m.call(var2)
  end
  def var1
    @var1
  end
  def var2
    @var2
  end
  def operator
    @operator
  end
  def question_ask
    puts "#{var1} #{operator} #{var2} = __?"
  end
  def answer
    @answer
  end
  def question_answer
    puts "#{var1} #{operator} #{var2} = #{answer}"
  end
end