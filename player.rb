class Player
  @@MAX_WEAPONS = 2
  @@MAX_SHIELDS = 3
  @@INITIAL_HEALTH = 10
  @HITS2LOSE = 3

  def initialize(number, intelligence, strength)
    @name = "Player##{number}"
    @number = number
    @intelligence = intelligence
    @strength = strength
    @health = @@INITIAL_HEALTH
    @consecutive_hits  = 0
    @weapons  = Array.new
    @shields = Array.new
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
    @health<=0
  end

  def move(direction, valid_moves)
    #No P2
  end

  def attack
    @strength + self.sum_weapons
  end

  def defend(received_attack)
    self.manage_hit(received_attack)
  end

  def receive_reward
    #No P2
  end

  def to_s
    "P[#{@name}, #{@intelligence}, #{@strength}, #{@health}, #{@row}, #{@col}, #{@consecutive_hits}, #{@weapons}, #{@shields}]"
  end

  private def receive_weapon(w)
    #No P2
  end

  private def receive_shield(s)
    #No P2
  end

  private def new_weapon
    if @weapons.size < @@MAX_WEAPONS
      weapon = Weapon.new(Dice.weapon_power, Dice.uses_left)
      @weapons.push(weapon)
      weapon
    end
  end

  private def new_shield
    if @shields.size < @@MAX_SHIELDS
      shield = Shield.new(Dice.shield_power, Dice.uses_left)
      @shields.push(shield)
      shield
    end
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
    #No P2
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