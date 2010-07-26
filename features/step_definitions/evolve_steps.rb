When /^I seed the grid with live cells at "([^"]*)"$/ do |live_series|
  coords = to_coords(live_series)
  @grid.seed coords
end

Then /^I should see live cells at "([^"]*)"$/ do |live_series|
  expect_life(live_series) {|cell| cell.alive?.should be_true } 
end

Then /^I should see dead cells at "([^"]*)"$/ do |dead_series|
  expect_life(dead_series) {|cell| cell.alive?.should be_false } 
end

def to_coords(series)
  series.split(/\s\&\s/).map {|pair| 
    pair.split(',').map {|num| num.to_i }
  }
end

def expect_life(series)
  to_coords(series).each {|coord| yield @grid.cell_at(*coord) }
end