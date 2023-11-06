module Main
require_relative '../Irrgarten/game'
require_relative '../Control/controller'
require_relative '../UI/textUI'

  game = Irrgarten::Game.new(2)
  text_ui = UI::TextUI.new
  controller = Control::Controller.new(game, text_ui)
  controller.play
end