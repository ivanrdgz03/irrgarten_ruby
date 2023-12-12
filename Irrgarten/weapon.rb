module Irrgarten
  require_relative 'dice'
  require_relative 'combat_element'
  class Weapon < Combat_element
    def initialize(effect, uses)
      super
    end
    def attack
      return self.produce_effect
    end

    def to_s
      "W" + super
    end
  end
end