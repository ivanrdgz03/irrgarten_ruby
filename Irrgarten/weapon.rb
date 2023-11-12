module Irrgarten
  require_relative 'dice'
  class Weapon
    def initialize(power, uses)
      @power = power
      @uses = uses
    end

    def attack
      aux = 0.0
      if @uses > 0
        @uses-=1
        aux = @power
      end
      aux
    end

    def to_s
      "W[#{@power},#{@uses}]"
    end

    def discard
      Dice.discard_element(@uses)
    end
  end
end