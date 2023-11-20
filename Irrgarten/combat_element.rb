class Combat_element
  def initialize(effect, uses)
    @effect = effect
    @uses = uses
  end
  protected def produce_effect
    aux = 0.0
    if @uses > 0
      --@uses
      aux = @power
    end
    aux
  end
  public def discard
    Dice.discard_element(@uses)
  end
  public def to_s
    "[#{@power},#{@uses}]"
  end
end
