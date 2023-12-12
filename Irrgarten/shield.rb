module Irrgarten
  require_relative 'dice'
  require_relative 'combat_element'
  class Shield < Combat_element
    def protect
      self.produce_effect
    end

    def to_s
      "S" + super
    end
  end
end