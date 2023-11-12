module Irrgarten
  require_relative 'dice'
  require_relative 'weapon'
  require_relative 'shield'
  # noinspection RubyTooManyInstanceVariablesInspection
  class Player
    @@MAX_WEAPONS = 2
    @@MAX_SHIELDS = 3
    @@INITIAL_HEALTH = 10
    @@HITS2LOSE = 3

    def initialize(number, intelligence, strength)
      @name = "Player ##{number}"
      @number = number
      @intelligence = intelligence
      @strength = strength
      @health = @@INITIAL_HEALTH
      @consecutive_hits = 0
      @weapons = Array.new
      @shields = Array.new
      @row
      @col
    end

    def resurrect
      @health = @@INITIAL_HEALTH
      self.reset_hits
      @weapons.clear
      @shields.clear
    end

    attr_reader :row, :col, :number

    def set_pos(row, col)
      @row = row
      @col = col
    end

    def dead
      @health <= 0
    end

    def move(direction, valid_moves)
      size = valid_moves.size
      contained = valid_moves.include? direction
      if size > 0 && !contained
        first_element = valid_moves[0]
        output = first_element
      else
        output = direction
      end
      output
    end

    def attack
      @strength + self.sum_weapons
    end

    def defend(received_attack)
      self.manage_hit(received_attack)
    end

    def receive_reward
      w_reward = Dice.weapons_reward
      s_reward = Dice.shields_reward
      while w_reward > 0
        wnew = self.new_weapon
        self.receive_weapon(wnew)
        w_reward -= 1
      end
      while s_reward > 0
        snew = self.new_shield
        self.receive_shield(snew)
        s_reward -= 1
      end
      extra_health = Dice.health_reward
      @health += extra_health
    end

    def to_s
      weapons_string = ""
      shields_string = ""
      @weapons.each do |weapon|
        weapons_string += " " + weapon.to_s
      end
      @shields.each do |shield|
        shields_string += " " + shield.to_s
      end
      "P[#{@name}, #{@intelligence}, #{@strength}, #{@health}, #{@row}, #{@col}, #{@consecutive_hits}, #{weapons_string}, #{shields_string}]"
    end

    private def receive_weapon(w)
      i = @weapons.size - 1
      while i >= 0
        discard = @weapons[i].discard
        if discard
          @weapons.delete_at(i)
        end
        i-=1
      end
      size = @weapons.size
      if size < @@MAX_WEAPONS
        @weapons.push(w)
      end
    end

    private def receive_shield(s)
      i = @shields.size - 1
      while i >= 0
        discard = @shields[i].discard
        if discard
          @shields.delete_at(i)
        end
        i-=1
      end
      size = @shields.size
      if size < @@MAX_SHIELDS
        @shields.push(s)
      end
    end

    private def new_weapon
      weapon = Weapon.new(Dice.random_strength, Dice.uses_left)
    end

    private def new_shield
      shield = Shield.new(Dice.shield_power, Dice.uses_left)
    end

    private def sum_weapons
      suma = 0.0
      @weapons.each do |weapon|
        suma = suma + weapon.attack
      end
      suma
    end

    private def sum_shields
      suma = 0.0
      @shields.each do |shield|
        suma = suma + shield.protect
      end
      suma
    end

    private def defensive_energy
      @intelligence + self.sum_shields
    end

    private def manage_hit(received_attack)
      defense = self.defensive_energy
      if defense < received_attack
        self.got_wounded
        self.inc_consecutive_hits
      else
        self.reset_hits
      end

      if @consecutive_hits == @@HITS2LOSE || self.dead
        self.reset_hits
        lose = true
      else
        lose = false
      end
      lose
    end

    private def reset_hits
      @consecutive_hits = 0
    end

    private def got_wounded
      @health -= 1
    end

    private def inc_consecutive_hits
      @consecutive_hits -= 1
    end
  end
end