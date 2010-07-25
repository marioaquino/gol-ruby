class Cell
  def initialize(alive = false)
    @alive = alive
  end
  
  def kill!
    @alive = false
  end
  
  def alive?
    @alive
  end
end