class Monster
  @@INITIAL_HEALTH = 5

  def initialize(name, intelligence, strength)
    @name = name
    @intelligence = intelligence
    @stregth = strength
    @health = @@INITIAL_HEALTH
    @row
    @col
  end

  def dead
    @health<=0
  end

  def attack
    Dice.intensity(@stregth)
  end

  def defend(received_attack)

  end

  def set_pos(row, col)
    @row = row
    @col = col
  end

  def to_s

  end
  private def got_wounded
    @health -= 1
  end
end