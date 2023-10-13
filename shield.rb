class Shield
  def initialize(protection, uses)
    @protection = protection
    @uses = uses
  end

  def protect
    aux = 0.0
    if @uses > 0
      --@uses
      aux = @protection
    end
    aux
  end

  def to_s
    "S[#{@protection},#{@uses}]"
  end

  def discard
    Dice.discard_element(@uses)
  end
end