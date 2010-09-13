get '/' do
  haml :index
end

get '/seed' do
  @rows = params[:rows].to_i
  @columns = params[:columns].to_i
  haml :seed
end

post '/evolution' do
  @rows = params.delete('rows').to_i
  @columns = params.delete('columns').to_i
  @live_cells = params.map{|key, value| key if value == 'true'}.compact
  haml :evolution
end

def parse(x_y)
  x_y.split('_').map{|num| num.to_i }
end

def panel_class(row, column)
  id = "#{row}_#{column}"
  "panel#{' flip' if @live_cells.include?(id)}"
end
