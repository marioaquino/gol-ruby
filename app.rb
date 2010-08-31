get '/' do
  haml :index
end

get '/seed' do
  @rows = params[:rows].to_i
  @columns = params[:columns].to_i
  haml :seed
end

post '/evolution' do
  rows = params.delete('rows').to_i
  columns = params.delete('columns').to_i
  @grid = Grid.new(rows, columns)
  live_cells = params.map{|key, value| parse(key) if value == 'true'}.compact
  @grid.seed(live_cells)
  @grid.evolve
  haml :evolution
end

def parse(x_y)
  x_y.split('_').map{|num| num.to_i }
end

def panel_class(row, column)
  "panel#{' flip' if @grid.cell_at(row, column).alive?}"
end
