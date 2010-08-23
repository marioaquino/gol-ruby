Feature: The grid is 2 dimensional and has a fixed number of cells in the x and y coordinate space.

	Scenario: Creating a grid
		Given I have no grid
		And I want the grid to have 6 rows and 6 columns
		When I create the grid
		Then the grid should have 6 rows and 6 columns
	
