Feature: Evolution
  In order to advance life on the grid
  As a grid deity
  I want evolution to determine whether cells live or die based on a simple set of rules

Scenario: Evolving a grid of no live cells
  Given I have a grid with 6 rows and 6 columns
  When I tell the grid to evolve
  Then all cells should be dead

Scenario: Evolving a grid with only 1 live cell
  Given I have a grid with 6 rows and 6 columns
	And I seed the grid with a live cell at 2, 2
  When I tell the grid to evolve
  Then all cells should be dead




