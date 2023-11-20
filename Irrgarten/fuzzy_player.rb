module Irrgarten
class Fuzzy_player < Player
  def initialize(other)
    self.copy(other)
  end
  def move(direction, valid_moves)
    Dice.next_step(direction, valid_moves, self.intelligence)
  end
  def attack
    super + Dice.intensity(self.strength)
  end
  def defensive_energy
    super + Dice.intensity(self.intelligence)
  end
  def to_s
    "Fuzzy" + super
  end
end
end
