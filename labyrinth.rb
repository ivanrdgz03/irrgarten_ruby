class Labyrinth
  @@BLOCK_CHAR = 'X'
  @@EMPTY_CHAR = '-'
  @@MONSTER_CHAR = 'M'
  @@COMBAT_CHAR = 'C'
  @@EXIT_CHAR = 'E'
  @@ROW = 0
  @@COL = 1

  def initialize(n_rows, n_cols, exit_row, exit_col)
    @n_rows = n_rows
    @n_cols = n_cols
    @exit_row = exit_row
    @exit_col = exit_col
  end

  def spread_players(players)

  end

  def have_a_winner

  end

  def to_s

  end

  def add_monster(row, col, monster)

  end

  def put_player(direction, player)

  end

  def add_block(orientation, start_row, start_col, length)

  end

  def valid_moves(row, col)

  end

  private def pos_ok(row, col)
    (row>=@@ROW && row<@nRows && col<@nCols && col>=@@COL)
  end

  private def empty_pos(row, col)

  end

  private def monster_pos(row, col)

  end

  private def exit_pos(row, col)
    (row == @exitRow && col == @exitCol)
  end

  private def combat_pos(row, col)

  end

  private def can_step_on(row, col)

  end

  private def update_old_pos(row, col)

  end

  private def dir_2_pos(row, col, direction)

  end

  private def random_empty_pos

  end

  private def put_player_2D(old_row, old_col, row, col, player)

  end
end
