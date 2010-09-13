Feature: Viewing Game of Life on the web
  In order to watch the patterns of the Game of Life in my browser
  As a human with a web browser
  I want to setup a grid and watch the Game of Life evolve in front of me

  Scenario: View Game of Life grid setup
    Given I have a browser
    When I go to "the home page"
    Then I should see "Welcome to Game of Life"
  	And I should see "Setup board with rows and columns"
		And the "Rows:" field should contain "0"
		And the "Columns:" field should contain "0"
		And I should see a "Create Grid" button
  
	Scenario: Create a grid of rows and columns
	  Given I go to "the home page"
	  When I fill in "Rows:" with "6"
	  And I fill in "Columns:" with "6"
		And I press "Create Grid"
		Then I should be on "the seed page"
		And I should see "Click on the white squares to seed the grid with live cells"
		And I should see a table with 6 rows and 6 columns
		And I should see a "Seed Grid" button
	
	@javascript
	Scenario: Selecting the live cells to seed the grid
	  Given I have setup a grid with 6 rows and 6 columns
	  When I click on the cell at 1,2
		And I click on the cell at 2,3
		And I click on the cell at 3,2
	  Then the cells at "1,2 & 2,3 & 3,2" should be alive
		And all other cells should be dead
		
	@javascript
	Scenario: Starting evolution on a seeded grid
	  Given I have seeded a 6 by 6 grid with live cells at the following locations:
			| | | | | | |
			| |X| | | | |
			|X| |X|X| | |
			| | |X| | | |
			| |X| | | | |
			| | | | | | |
	  When I press "Seed Grid"
		Then I should be on "the evolution page"
		And I should see a table with 6 rows and 6 columns
	  And I should see the following live and dead cells on the grid:
			| | | | | | |
			| |X|X| | | |
			| | |X|X| | |
			| | |X|X| | |
			| | | | | | |
			| | | | | | |
		
	@selenium
	Scenario: Pausing evolution
	  Given I have seeded a 6 by 6 grid with live cells at the following locations:
			| | | | | | |
			| |X| | | | |
			|X| |X|X| | |
			| | |X| | | |
			| |X| | | | |
			| | | | | | |
	  When I press "Seed Grid"
		And I wait 3 seconds
	  And I press "Pause Evolution"
	  Then I should see the following live and dead cells on the grid:
			| | |X| | | |
			| | |X| | | |
			| |X| | | | |
			| | | | | | |
			| | | | | | |
			| | | | | | |
	
	
	
	
	
	
	
	
  
