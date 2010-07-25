class Grid
  def initialize(rows, columns)
    @cells = Array.new(rows)
    @cells.map! {Array.new(columns){ Cell.new }}
  end
  
  def seed(live_cells = [])
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
end