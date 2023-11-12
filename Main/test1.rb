require_relative '../Irrgarten/shield'
require_relative '../Irrgarten/weapon'
require_relative '../Irrgarten/dice'
require_relative '../Irrgarten/game_state'
class Test1
  def self.probar
    weapon = Irrgarten::Weapon.new(Irrgarten::Dice.weapon_power,Irrgarten::Dice.uses_left)
    shield = Irrgarten::Shield.new(Irrgarten::Dice.shield_power,Irrgarten::Dice.uses_left)
    nplayers = 2
    ancho = 10
    alto = 10
    competence=10.0
    salida=0.0
    n_ensayos = 100.0
    game_status = Irrgarten::Game_state.new("laberinto",3,4,1,true,"log")
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

    puts "Who Start = #{Irrgarten::Dice.who_starts(nplayers)}"
    puts "InitialPos = [#{Irrgarten::Dice.random_pos(ancho)}, #{Irrgarten::Dice.random_pos(alto)}]"
    puts "Intelligence = #{Irrgarten::Dice.random_intelligence}"
    puts "Resurrect Player = #{Irrgarten::Dice.resurrect_player}"
    puts "Weapons Reward = #{Irrgarten::Dice.weapons_reward}"
    puts "Shield Reward = #{Irrgarten::Dice.shields_reward}"
    puts "Health Reward = #{Irrgarten::Dice.health_reward}"
    puts "Intensity = #{Irrgarten::Dice.intensity(competence)}"
    (0..n_ensayos).each { |_|
      if Irrgarten::Dice.discard_element(1)
        salida += 1
      end
    }


    puts(salida/n_ensayos)
  end
  self.probar
end