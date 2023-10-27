require_relative 'game'
require_relative 'controller'
require_relative 'textUI'
module Irrgarten
  game = Game.new(1)
  textUI = UI::TextUI.new()
  controller = Control::Controller.new(game, textUI)
  controller.play
end