module Irrgarten
require_relative 'dice'
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
    @health <= 0
  end

  def attack
    Dice.intensity(@stregth)
  end

  def defend(received_attack)
    is_dead = self.dead
    if !is_dead
      defensive_energy = Dice.intensity(@intelligence)
      if defensive_energy < received_attack
        self.got_wounded
        is_dead = self.dead
      end
    end
    is_dead
  end

  def set_pos(row, col)
    @row = row
    @col = col
  end

  def to_s
    "M[##{@name}, #{@intelligence}, #{@stregth}, #{@health}, #{@row}, #{@col}]"
  end
  private def got_wounded
    @health -= 1
  end
end
end