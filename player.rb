class Player 
  def initialize(name)
    @name = name
    @hp = 3
  end
  def name
    @name
  end

  def hp
    @hp
  end

  def hp=(points)
    @hp = points
  end

  def dead?
    @hp <= 0
  end

  def takes_damage(points)
    @hp -= points
  end
end