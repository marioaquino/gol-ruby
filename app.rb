get '/' do
  haml :index
end

get '/seed' do
  @rows = params[:rows].to_i
  @columns = params[:columns].to_i
  haml :seed
end