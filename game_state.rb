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
  def to_s
    "Labyrinth: " + @labyrinthv.to_s + "\nPlayers: " + @players.to_s + "\nMonsters: " + @monsters.to_s + "\nCurrent player: " + @currentPlayer.to_s + "\nWinner: " + @winner.to_s + "\nLog: " + @log.to_s + "\n"
  end
end