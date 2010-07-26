Feature: Evolution
  In order to advance life on the grid
  As a grid deity
  I want evolution to determine whether cells live or die based on a simple set of rules

	Scenario: Evolving a grid of no live cells
	  Given I have a grid with 6 rows and 6 columns
	  When I tell the grid to evolve
	  Then all cells should be dead

	Scenario: Evolving a grid with only 1 live cell should kill the cell
	  Given I have a grid with 6 rows and 6 columns
		And I seed the grid with a live cell at 2, 2
	  When I tell the grid to evolve
	  Then all cells should be dead

	Scenario Outline: Evolving a grid with a cluster of cells
	  Given I have a grid with 2 rows and 2 columns
	  When I seed the grid with live cells at <row_col_series> 
		And I tell the grid to evolve
	  Then I should see live cells at <live_cell_series>
		And I should see dead cells at <dead_cell_series>
	
	Examples:
		| row_col_series 					| live_cell_series 				| dead_cell_series 				|
		| "0,0 & 1,1" 	 					| ""											| "0,0 & 0,1 & 1,0 & 1,1" |
		| "0,0 & 0,1" 	 					| ""											| "0,0 & 0,1 & 1,0 & 1,1" |
		| "0,0 & 0,1 & 1,0" 			| "0,0 & 0,1 & 1,0 & 1,1" | ""											|
		| "0,0 & 0,1 & 1,0 & 1,1" | "0,0 & 0,1 & 1,0 & 1,1"	| ""											|
