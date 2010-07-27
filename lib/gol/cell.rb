class Cell
  def initialize(alive = false)
    @alive = alive
  end
  
  def kill!
    @alive = false
  end
  
  def revive!
    @alive = true
  end
  
  def alive?
    @alive
  end
  
  def evolve
    @alive = !@alive
  end
end