Feature: The grid is 2 dimensional and has a fixed number of cells in the x and y coordinate space.

Scenario: Creating a grid
	Given I have no grid
	And I want the grid to have 6 rows and 6 columns
	When I create the grid
	Then the grid should have 6 rows and 6 columns
	
Scenario: Seeding a grid
  Given I have a grid with 6 rows and 6 columns
  When I seed the grid with an empty list of live cells
	Then there should be 36 cells
  And all cells should be dead



# Feature: The Game of Life defines a grid where cells can live or die based
# 	on rules related to their positions on the grid and whether they have neighbors.
# 
# Scenario: Selecting cells
# 	Given I have a grid
# 	And I select some cell at 2 and 4 to be alive
# 	And I select some cell at 3 and 3 to be alive
# 	And I select some cell at 3 and 4 to be alive
# 	When I evolve
# 	Then the cell at 3 and 3 is alive
# 	And the cell at 2 and 5 is alive