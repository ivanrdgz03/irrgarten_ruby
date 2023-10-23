class Game
  @@MAX_ROUNDS = 10

  def initialize(nplayers)
    @players = Array.new
    nplayers.each do |i|
      @players[i] = Player.new(i, Dice.random_intelligence, Dice.random_strength)
    end

    @current_player_index = Dice.who_starts(nplayers)
    @log = ''
    @labyrinth = Labyrinth.new(3,3,2,3)
    @current_player = @players[@current_player]
    @monsters = Array.new
  end

  def finished
    @labyrinth.have_a_winner
  end

  def next_step(preferred_direction)
    #No P2
  end

  def get_game_state
    Game_state.new(@labyrinth.to_s, @players.to_s, @monsters.to_s, @current_player_index, self.finished, @log)
  end

  private def configure_labyrinth

  end

  private def next_player
    @current_player_index = (@current_player_index + 1) % @players.size
    @current_player = @players[@current_player_index]
  end

  private def actual_direction(preferred_direction)
    #No P2
  end

  private def combat(monster)
    #No P2
  end

  private def manage_reward(winner)
    #No P2
  end

  private def manage_resurrection
    #No P2
  end

  private def log_player_won
    @log += "The player has won\n"
  end

  private def log_monster_won
    @log += "The monster has won\n"
  end

  private def log_resurrected
    @log += "The player has resurrected\n"
  end

  private def log_player_skip_turn
    @log += "The player skip his turn\n"
  end

  private def log_player_no_orders
    @log += "It was impossible do the mouvements\n"
  end

  private def log_no_monster
    @log += "The player has mouved to a empty square\n"
  end

  private def log_rounds(rounds, max)
    @log += "#{rounds} of #{max} rounds of combat have occurred\n";
  end
end
