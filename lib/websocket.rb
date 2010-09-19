require 'rubygems'
require 'eventmachine'
require 'em-websocket'
require 'json'

require 'pp'

require 'gol'

EventMachine.run do
  EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 9090) do |socket|
    socket.onopen do
      p "Just opened a socket..."
    end

    socket.onmessage do |message|
      evt = JSON.parse(message)
      case evt['type']
      when 'seed'
        rows = evt['rows'].to_i
        columns = evt['columns'].to_i
        @grid = GOL::Grid.new(rows, columns)
        live_seed = evt['alive'].map{|cell| cell.split('_').map{|num| num.to_i }}
        @grid.seed(live_seed)
      when 'step'
        @grid.evolve
        live_cells = []
        @grid.each_cell{|cell, x, y| live_cells << "#{x}_#{y}" if cell.alive?}
        payload = {:live => live_cells}.to_json
        socket.send(payload)
      end
    end

    socket.onclose do
      p "Just closed a socket..."
    end
  end
end

