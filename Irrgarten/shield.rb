module Irrgarten
  require_relative 'dice'
  class Shield < Combat_element
    def protect
      self.produce_effect
    end

    def to_s
      "S" + super
    end
  end
end