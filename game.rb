require_relative 'player'
require_relative 'dice'
require_relative 'labyrinth'
require_relative 'game_state'
class Game
  @@MAX_ROUNDS = 10

  def initialize(nplayers)
    @players = []
    i = 0
    while i != nplayers
      @players[i] = Player.new(i, Dice.random_intelligence, Dice.random_strength)
      @players[i].set_pos(0,0)
      i+=1
    end

    @current_player_index = Dice.who_starts(nplayers)
    @log = ''
    @labyrinth = Labyrinth.new(3,3,3,3)
    @current_player = @players[@current_player_index]
    @monsters = Array.new
  end

  def finished
    @labyrinth.have_a_winner
  end

  def next_step(preferred_direction)
    dead = @current_player.dead
    if !dead
      direction = self.actual_direction(preferred_direction)
      if direction != preferred_direction
        self.log_player_no_orders
      end
      monster = @labyrinth.put_player(direction, @current_player)
      if monster == nil
        self.log_no_monster
      else
        winner = self.combat(monster)
        self.manage_reward(winner)
      end
    else
      self.manage_resurrection
    end
    end_game = self.finished
    if !end_game
      self.next_player
    end

    end_game
  end

  def game_state
    Game_state.new(@labyrinth.to_s, @players.to_s, @monsters.to_s, @current_player_index, self.finished, @log)
  end

  private def configure_labyrinth
    monster = Monster.new(1,Dice.random_intelligence, Dice.random_strength)
    @monsters.push(monster)
    @labyrinth.add_monster(2,1,monster)
  end

  private def next_player
    @current_player_index = (@current_player_index + 1) % @players.size
    @current_player = @players[@current_player_index]
  end

  private def actual_direction(preferred_direction)
    if @current_player != nil
      current_row = @current_player.row
      current_col = @current_player.col
      valid_moves = @labyrinth.valid_moves(current_row,current_col)

      output = @current_player.move(preferred_direction, valid_moves)

      output
    end
  end

  private def combat(monster)
    rounds = 0
    winner = Game_character::PLAYER
    player_attack = @current_player.attack
    lose = monster.defend(player_attack)

    while !lose && rounds < @@MAX_ROUNDS
      winner = Game_character::MONSTER
      rounds += 1
      monster_attack = monster.attack
      lose = @current_player.defend(monster_attack)
      if !lose
        player_attack = @current_player.attack
        winner = Game_character::PLAYER
        lose = monster.defend(player_attack)
      end
    end
    self.log_rounds(rounds, @@MAX_ROUNDS)

    winner
  end

  private def manage_reward(winner)
    if winner == Game_character::PLAYER
      @current_player.receive_reward
      self.log_player_won
    else
      self.log_monster_won
    end
  end

  private def manage_resurrection
    resurrect = Dice.resurrect_player
    if resurrect
      @current_player.resurrect
      self.log_resurrected
    else
      self.log_player_skip_turn
    end
  end

  private def log_player_won
    @log += "The player #{@current_player.number} has won the match\n"
  end

  private def log_monster_won
    @log += "The monster has won the combat\n";
  end

  private def log_resurrected
    @log += "The player #{@current_player.number} has resurrected\n"
  end

  private def log_player_skip_turn
    @log += "The player #{@current_player.number} has lost his turn because is dead\n"
  end

  private def log_player_no_orders
    @log += "The player #{@current_player.number} has not followed the instructions of the human player (not possible)\n"
  end

  private def log_no_monster
    @log += "The player #{@current_player.number} has moved to an empty cell or has been unable to move\n"
  end

  private def log_rounds(rounds, max)
    @log += "#{rounds} of #{max} combat rounds have occurred\n";
  end
end
