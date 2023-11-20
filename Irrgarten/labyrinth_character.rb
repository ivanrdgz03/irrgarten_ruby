module Irrgarten
class Labyrinth_character
  public attr_reader :row, :col
  protected attr_reader :intelligence, :strength, :health
  protected attr_writer :health
  def initialize(name, intelligence, strength, health)
    @name = name
    @intelligence = intelligence
    @strength = strength
    @health = health
    @row
    @col
  end
  def copy(other)
    self.initialize(other.name, other.intelligence other.strength, other.health)
    @row = other.row
    @col = other.col
  end
  def dead
    @health <= 0
  end
  public def set_pos(row,col)
    @row = row
    @col = col
  end
  public def to_s

  end
  protected def got_wounded
    @health -= 1
  end
  public def attack
    raise NotImplementedError
  end
  public def defend(attack)
    raise NotImplementedError
  end
end
end