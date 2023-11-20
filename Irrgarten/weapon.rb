module Irrgarten
  require_relative 'dice'
  class Weapon < Combat_element
    def initialize(effect, uses)
      super
    end
    def attack
      self.produce_effect
    end

    def to_s
      "W" + super
    end
  end
end