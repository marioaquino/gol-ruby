Given /^I have no grid$/ do
  @grid.should be_nil
end

Given /^I want the grid to have (\d+) rows and (\d+) columns$/ do |rows, columns|
  @rows, @columns = rows, columns
end

When /^I create the grid$/ do
  setup_grid @rows, @columns
end

def setup_grid(rows, columns)
  @grid = GOL::Grid.new rows.to_i, columns.to_i
end

Then /^the grid should have (\d+) rows and (\d+) columns$/ do |rows, columns|
  @grid.rows.should == rows.to_i
  @grid.columns.should == columns.to_i
end

Given /^I have a grid with (\d+) rows and (\d+) columns$/ do |rows, columns|
  setup_grid rows, columns
end

When /^I seed the grid with an empty list of live cells$/ do
  @grid.seed
end

Then /^all cells should be dead$/ do
  @grid.each_cell {|cell, x, y| cell.alive?.should be_false }
end

Then /^there should be (\d+) cells$/ do |arg1|
  @grid.cell_count.should == 36
end

When /^I seed the grid with a live cell at (\d+), (\d+)$/ do |x, y|
  @grid.seed [[x.to_i, y.to_i]]
end

Then /^the cell at (\d+), (\d+) should be alive$/ do |x, y|
  @grid.cell_at(x.to_i, y.to_i).alive?.should be_true
end

When /^I tell the grid to evolve$/ do
  @grid.evolve
end
