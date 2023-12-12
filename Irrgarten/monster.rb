module Irrgarten
require_relative 'dice'
class Monster < Labyrinth_character
  @@INITIAL_HEALTH = 5

  def initialize(name, intelligence, strength)
    super(name, intelligence, strength, @@INITIAL_HEALTH)
  end
  def attack
    Dice.intensity(self.strength)
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

  def to_s
    "M"+ super.to_s
  end
end
end