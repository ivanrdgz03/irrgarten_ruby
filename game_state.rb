class Game_state
  def initialize(labyrinthv, players, monsters, current_player, winner, log)
    @labyrinthv = labyrinthv
    @players = players
    @monsters = monsters
    @current_player = current_player
    @winner = winner
    @log = log
  end
  attr_reader :log, :winner, :players, :current_player, :monsters, :labyrinthv
end
