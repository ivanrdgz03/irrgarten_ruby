require_relative 'Irrgarten/en/shield'
require_relative 'Irrgarten/weapon'
require_relative 'Irrgarten/dice'
require_relative 'Irrgarten/game_state'
class Test1
  def self.probar
    weapon = Weapon.new(Dice.weapon_power,Dice.uses_left)
    shield = Shield.new(Dice.shield_power,Dice.uses_left)
    nplayers = 2
    ancho = 10
    alto = 10
    competence=10.0
    salida=0.0
    n_ensayos = 100.0
    game_status = Game_state.new("laberinto",3,4,1,true,"log")
    puts "Log = #{game_status.log}"
    puts "Labyrinthv = #{game_status.labyrinthv}"
    puts "Players = #{game_status.players}"
    puts "Monsters = #{game_status.monsters}"
    puts "Current player = #{game_status.current_player}"
    puts "Winner = #{game_status.winner}"

    puts weapon.to_s
    puts shield.to_s
    puts "Weapon attack = #{weapon.attack}"
    puts "Shield protect = #{shield.protect}"
    puts weapon.to_s
    puts shield.to_s

    puts "Who Start = #{Dice.who_starts(nplayers)}"
    puts "InitialPos = [#{Dice.random_pos(ancho)}, #{Dice.random_pos(alto)}]"
    puts "Intelligence = #{Dice.random_intelligence}"
    puts "Resurrect Player = #{Dice.resurrect_player}"
    puts "Weapons Reward = #{Dice.weapons_reward}"
    puts "Shield Reward = #{Dice.shields_reward}"
    puts "Health Reward = #{Dice.health_reward}"
    puts "Intensity = #{Dice.intensity(competence)}"
    (0..n_ensayos).each { |_|
      if Dice.resurrect_player
        salida += 1
      end
    }


    puts(salida/n_ensayos)
  end
  end