module Irrgarten
  class Dice
    @@MAX_USES = 5
    @@MAX_INTELLIGENCE = 10.0
    @@MAX_STRENGTH = 10.0
    @@RESURRECT_PROB = 0.3
    @@WEAPONS_REWARD = 2
    @@SHIELD_REWARD = 3
    @@HEALTH_REWARD = 5
    @@MAX_ATTACK = 3
    @@MAX_SHIELD = 2

    @generator = Random.new


    def self.random_pos(max)
      @generator.rand(0...max)
    end

    def self.who_starts(nplayers)
      @generator.rand(0...nplayers)
    end

    def self.random_intelligence
      @generator.rand(0.0...@@MAX_INTELLIGENCE)
    end

    def self.random_strength
      @generator.rand(0.0...@@MAX_STRENGTH)
    end

    def self.resurrect_player
      aux = false
      if @generator.rand < @@RESURRECT_PROB
        aux = true
      end
      aux
    end

    def self.weapons_reward
      @generator.rand(0..@@WEAPONS_REWARD)
    end

    def self.shields_reward
      @generator.rand(0..@@SHIELD_REWARD)
    end

    def self.health_reward
      @generator.rand(0..@@HEALTH_REWARD)
    end

    def self.weapon_power
      @generator.rand(0.0...@@MAX_ATTACK)
    end

    def self.shield_power
      @generator.rand(0.0...@@MAX_SHIELD)
    end

    def self.uses_left
      @generator.rand(0..@@MAX_USES)
    end

    def self.intensity(competence)
      @generator.rand(0...competence)
    end

    def self.discard_element(uses_left)
      prob = 1.0 - (uses_left.to_f / @@MAX_USES)

      @generator.rand < prob
    end
    def self.next_step(preference, valid_moves, intelligence)
      if valid_moves.include?(preference) and Dice.random_intelligence < intelligence
        preference
      else
        valid_moves[@generator.rand(0..valid_moves.length)]
      end
    end
  end
end