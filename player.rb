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
    @consecutive_hits = 0
    @row
    @col
    @weapons
    @shields
  end

  def resurrect

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

  end

  def attack
    @strength + self.sum_weapons
  end

  def defend(received_attack)
    self.manage_hit(received_attack0)
  end

  def receive_reward

  end

  def to_s

  end

  def receive_weapon(w)

  end

  def receive_shield(s)

  end

  def new_weapon

  end

  def new_shield

  end

  def sum_weapons

  end

  def sum_shields

  end

  def defensive_energy
    @intelligence + self.sum_shields
  end

  def manage_hit(received_attack)

  end

  def reset_hits
    @consecutive_hits = 0
  end

  private def got_wounded
    @health -= 1
  end

  private def inc_consecutive_hits
    @consecutive_hits -= 1
  end

end
