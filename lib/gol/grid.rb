class Grid
  def initialize(rows, columns)
    initialize_grid rows, columns
  end
  
  def seed(live_cells = [])
    initialize_grid(rows, columns)
    live_cells.each{|coord| x, y = *coord; @cells[x][y] = Cell.new(true)}
  end
  
  def evolve
    each_cell {|cell| cell.kill! }
  end
  
  def cell_count
    @cells.size * @cells[0].size
  end
  
  def rows
    @cells.size
  end
  
  def columns
    @cells[0].size
  end
  
  def each_cell
    @cells.each {|col| col.each {|cell| yield cell }}
  end
  
  def cell_at(x, y)
    @cells[x][y]
  end
  
  private
  def initialize_grid(rows, columns)
    @cells = Array.new(rows)
    @cells.map! {Array.new(columns){ Cell.new }}
  end
end