module Irrgarten
  require_relative 'monster'
  require_relative 'player'
  require_relative 'directions'
  require_relative 'dice'

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
      #Inicializacion de @labyrinth a @@EMPTY_CHAR
      (0...n_rows).each do |i|
        (0...n_cols).each do |j|
          @labyrinth[i][j] = @@EMPTY_CHAR
        end
      end
      @labyrinth[exit_row][exit_col] = @@EXIT_CHAR
    end

    def spread_players(players)
      old_row = -1
      old_col = -1
      players.each do |p|
        pos = self.random_empty_pos
        self.put_player_2d(old_row, old_col, pos[0], pos[1], p)
      end
    end

    def have_a_winner
      salida = false

      (0...@n_rows).each do |i|
        (0...@n_cols).each do |j|
          if @players[i][j] != nil
            if @players[i][j].row == @exit_row && @players[i][j].col == @exit_col
              salida = true
            end
          end
        end
      end
      salida
    end

    def to_s
      matrix_string = ""
      @labyrinth.each do |fila|
        matrix_string += "\n[" + fila.join(', ') + "]"
      end
      "L[#{@n_rows}, #{@n_cols}, #{@exit_row}, #{@exit_col}, #{matrix_string}]"
    end

    def add_monster(row, col, monster)
      if self.pos_ok(row, col) && self.empty_pos(row, col)
        monster.set_pos(row, col)
        @labyrinth[row][col] = @@MONSTER_CHAR
        @monsters[row][col] = monster
      end
    end

    def put_player(direction, player)
      old_row = player.row
      old_col = player.col

      new_pos = self.dir_2_pos(old_row, old_col, direction)
      monster = self.put_player_2d(old_row, old_col, new_pos[0], new_pos[1], player)
    end

    def add_block(orientation, start_row, start_col, length)
      if orientation == Orientation::VERTICAL
        inc_row = 1
        inc_col = 0
      else
        inc_row = 0
        inc_col = 1
      end

      row = start_row
      col = start_col
      while self.pos_ok(row, col) && self.empty_pos(row, col) && length > 0
        @labyrinth[row][col] = @@BLOCK_CHAR
        length -= 1
        row += inc_row
        col += inc_col
      end
    end

    def valid_moves(row, col)
      output = Array.new
      if self.can_step_on(row + 1, col)
        output.push(Irrgarten::Directions::DOWN)
      end
      if self.can_step_on(row - 1, col)
        output.push(Irrgarten::Directions::UP)
      end
      if self.can_step_on(row, col + 1)
        output.push(Irrgarten::Directions::RIGHT)
      end
      if self.can_step_on(row, col - 1)
        output.push(Irrgarten::Directions::LEFT)
      end

      output
    end

    private def pos_ok(row, col)
      row >= 0 && row < @n_rows && col < @n_cols && col >= 0
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
      self.pos_ok(row, col) && (self.empty_pos(row, col) || self.monster_pos(row, col) || self.exit_pos(row, col))
    end

    private def update_old_pos(row, col)
      if self.pos_ok(row, col)
        if self.combat_pos(row, col)
          @labyrinth[row][col] = @@MONSTER_CHAR
        else
          @labyrinth[row][col] = @@EMPTY_CHAR
        end
      end
    end

    private def dir_2_pos(row, col, direction)
      case direction
      when Irrgarten::Directions::UP
        row -= 1
      when Irrgarten::Directions::DOWN
        row += 1
      when Irrgarten::Directions::RIGHT
        col += 1
      when Irrgarten::Directions::LEFT
        col -= 1
      else
        exit(1)
      end

      [row, col]
    end

    private def random_empty_pos
      begin
        row = Dice.random_pos(@n_rows)
        col = Dice.random_pos(@n_cols)
      end while !(self.pos_ok(row, col) && self.empty_pos(row, col))
      [row, col]
    end

    private def put_player_2d(old_row, old_col, row, col, player)
      output = nil
      if self.can_step_on(row, col)
        if self.pos_ok(old_row, old_col)
          p = @players[old_row][old_col]
          if p == player
            self.update_old_pos(old_row, old_col)
            @players[old_row][old_col] = nil
          end
        end

        monster_pos = self.monster_pos(row, col)
        if monster_pos
          @labyrinth[row][col] = @@COMBAT_CHAR
          output = @monsters[row][col]
        else
          number = player.number.to_s
          @labyrinth[row][col] = number
        end
        @players[row][col] = player
        player.set_pos(row, col)
      end
      output
    end
  end
end
