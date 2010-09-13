Conway's Game of Life implemented in Ruby

Given a 2D grid of arbitrary dimensions, populated by cells that can either be alive or dead, the following rules apply to all cells in the grid:

1. Any live cell with fewer than two live neighbors dies, as if caused by under-population.
2. Any live cell with more than three live neighbors dies, as if by overcrowding.
3. Any live cell with two or three live neighbors lives on to the next generation.
4. Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

This implementation was a product of outside-in development, using Cucumber and RSpec to guide the design decisions.

To run this implementation, you will need Ruby 1.8.7 and the Bundler gem:

`$> gem install bundler`

Then, (to install all the libraries this implementation depends on)

`$> bundle install`

Then, (to start the web server)

`$> rackup`

Then, (to start the web socket server)

`$> cd lib
$> ruby websocket.rb
`

Then... point your CSS3/WebSockets compliant browser (Safari 5.x or higher, Chrome 6.x or higher) to: http://localhost:9292