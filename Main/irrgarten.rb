require_relative '../Irrgarten/game'
require_relative '../Control/controller'
require_relative '../UI/textUI'
module Main
  game = Irrgarten::Game.new(1)
  text_ui = UI::TextUI.new
  controller = Control::Controller.new(game, text_ui)
  controller.play
end