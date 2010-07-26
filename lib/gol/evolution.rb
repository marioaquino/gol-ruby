module GOL
  module GridWalker
    
    def neighbors_of(x, y)
      r, c = rows, columns
      neighbors(x, y).each {|point|
        yield *point if passes_neighbors_checks(r, c, point)
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
end