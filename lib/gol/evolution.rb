module GOL
  # def live_counter(neighbors)
  #   neighbors.reduce(0) {|counter, cell| counter + (cell.alive? ? 1 : 0)}
  # end
  
  module GridWalker
    
    def neighbors_of(x, y)
      r, c = rows, columns
      neighbors(x, y).select {|point|
        passes_neighbors_checks(r, c, point)
      }
    end
    
    private
    def range(v)
      (v-1..v+1)
    end

    def neighbors(x, y)
      grid = range(x).to_a.product(range(y).to_a)
      grid.delete_at(4) # scrap center coordinate (which is x,y)
      grid
    end
    
    def passes_neighbors_checks(rows, columns, point)
      return false if point[0] >= rows
      return false if point[1] >= columns
      point.none? {|c| c < 0}
    end
    
    module_function :neighbors_of
  end
  
  class Countable
    def self.live_cell_count(neighbors)
      neighbors.reduce(0) {|counter, cell| counter + (cell.alive? ? 1 : 0)}
    end
  end
  
  class Rule1 < Countable
    def self.evaluate(neighbors = [])
      return false if neighbors.size < 2
      live_cell_count(neighbors) > 1
    end
  end
  
  class Rule2 < Countable
    def self.evaluate(neighbors = [])
      return true if neighbors.size < 4
      live_cell_count(neighbors) < 4
    end
  end
  
  class Rule3 < Countable
    def self.evaluate(neighbors = [])
      live = live_cell_count(neighbors)
      live == 2 || live == 3 
    end
  end
end