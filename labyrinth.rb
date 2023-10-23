class Labyrinth
  @@BLOCK_CHAR = 'X'
  @@EMPTY_CHAR = '-'
  @@MONSTER_CHAR = 'M'
  @@COMBAT_CHAR = 'C'
  @@EXIT_CHAR = 'E'
  @@ROW = 0
  @@COL = 0

  def initialize(n_rows, n_cols, exit_row, exit_col)
    @n_rows = n_rows
    @n_cols = n_cols
    @exit_row = exit_row
    @exit_col = exit_col
    @monsters = Array.new(n_rows) { Array.new(n_cols) }
    @players = Array.new(n_rows) { Array.new(n_cols) }
    @labyrinth = Array.new(n_rows) { Array.new(n_cols) }
  end

  def spread_players(players)
    #No P2
  end

  def have_a_winner
    salida = false

    @players.each do |fila|
      fila.each do |player|
        if player.row == @exit_row && player.col == @exit_col
          salida =true
        end
      end
    end
    salida
  end

  def to_s
    "L[#{@n_rows}, #{@n_cols}, #{@exit_row}, #{@exit_col}]"
  end

  def add_monster(row, col, monster)
    if self.pos_ok(row,col) && self.empty_pos(row,col)
      monster.set_pos(row,col)
      @labyrinth[row][col] = @@MONSTER_CHAR
      @monsters[row][col] = monster
    end
  end

  def put_player(direction, player)
    #No P2
  end

  def add_block(orientation, start_row, start_col, length)
    #No P2
  end

  def valid_moves(row, col)
    #No P2
  end

  private def pos_ok(row, col)
    row>=@@ROW && row<@n_rows && col<@n_cols && col>=@@COL
  end

  private def empty_pos(row, col)
    @labyrinth[row][col] == @@EMPTY_CHAR
  end

  private def monster_pos(row, col)
    @labyrinth[row][col] == @@MONSTER_CHAR
  end

  private def exit_pos(row, col)
    row == @exit_row && col == @exit_col
  end

  private def combat_pos(row, col)
    @labyrinth[row][col] == @@COMBAT_CHAR
  end

  private def can_step_on(row, col)
    self.pos_ok(row,col) && (self.empty_pos(row,col) || self.monster_pos(row,col) || self.exit_pos(row,col))
  end

  private def update_old_pos(row, col)
    if self.pos_ok(row,col)
      @labyrinth[row][col] = @@COMBAT_CHAR
    else
      @labyrinth[row][col] = @@EMPTY_CHAR
    end
  end

  private def dir_2_pos(row, col, direction)
    case direction
    when UP
      row+=1
    when DOWN
      row-=1
    when RIGHT
      col+=1
    when LEFT
      col-=1
    else
      puts("Se introdujo una dirección invalida")
    end

    [row,col]
  end

  private def random_empty_pos
    begin
      row = Dice.random_pos(@n_rows)
      col = Dice.random_pos(@n_cols)
    end while self.pos_ok(row,col) && self.empty_pos(row,col)
    [row,col]
  end

  private def put_player_2d(old_row, old_col, row, col, player)
    #No P2
  end
end
