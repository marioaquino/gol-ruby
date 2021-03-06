module GOL
  class Grid
    include GridWalker
  
    def initialize(rows, columns)
      initialize_grid rows, columns
    end
  
    def seed(live_cells = [])
      each_cell {|cell, x, y| live_cells.include?([x, y]) ? cell.revive! : cell.kill! }
    end
  
    def evolve
      cells_to_flip = []
      each_cell {|cell, x, y| 
        cells_to_flip << [x, y] if should_flip_cell?(cell, x, y)
      }
      cells_to_flip.compact.each{|point| cell_at(*point).evolve}
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
      @cells.each_with_index { |col, x| 
        col.each_with_index { |cell, y| yield cell, x, y }
      }
    end
  
    def cell_at(x, y)
      @cells[x][y]
    end
  
    private
    def should_flip_cell?(cell, x, y)
      neighbors = neighbors_of(x, y).map{|point| cell_at(*point)}
      (cell.alive? ? should_kill?(neighbors) : should_revive?(neighbors))
    end
  
    def should_kill?(neighbors)
      live_on_rules.all? {|rule| rule.evaluate(neighbors) } == false
    end
  
    def should_revive?(neighbors)
      Rule4.evaluate(neighbors)
    end
  
    def live_on_rules
      [Rule1, Rule2, Rule3]
    end
  
    def initialize_grid(rows, columns)
      @cells = Array.new(rows){ Array.new(columns){ Cell.new } }
    end
  end
end