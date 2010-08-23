Feature: Seeding the grid with live cells
  In order to start the grid with live cells
  As a grid deity
  I want to tell the grid which cells start off alive

	Scenario: Seeding a grid with nothing
	  Given I have a grid with 6 rows and 6 columns
	  When I seed the grid with an empty list of live cells
		Then there should be 36 cells
	  And all cells should be dead

	Scenario: Seeding a grid with 1 cell
	  Given I have a grid with 6 rows and 6 columns
	  When I seed the grid with a live cell at 3, 3
		Then there should be 36 cells
	  And the cell at 3, 3 should be alive

	Scenario: Seeding a grid starts it off anew
	  Given I have a grid with 6 rows and 6 columns
		And I seed the grid with a live cell at 3, 3
	  When I seed the grid with an empty list of live cells
	  Then all cells should be dead


