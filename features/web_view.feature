Feature: Viewing Game of Life on the web
  In order to watch the patterns of the Game of Life in my browser
  As a human with a web browser
  I want to setup a grid and watch the Game of Life evolve in front of me

  Scenario: View Game of Life grid setup
    Given I have a browser
    When I visit "/"
    Then I should see "Welcome to Game of Life"
  	And I should see "Setup board with rows and columns"
		And I should see a field labeled "Rows:" with the value "0"
		And I should see a field labeled "Columns:" with the value "0"
		And I should see a "Create Grid" button
  
	Scenario: Create a grid of rows and columns
	  Given I visit "/"
	  When I set the field labeled "Rows:" with the value "6"
	  And I set the field labeled "Columns:" with the value "6"
		And I press the "Create Grid" button
		Then I should be on the "/seed" page
		And I should see "Click on the white squares to seed the grid with live cells"
		And I should see a table named "grid" with 6 rows and 6 columns
		And I should see a "Seed Grid" button
	
	@selenium
	Scenario: Selecting the live cells to seed the grid
	  Given I have setup a grid with 6 rows and 6 columns
	  When I click on the cell at 1,2
		And I click on the cell at 2,3
		And I click on the cell at 3,2
	  Then the cells at "1,2 & 2,3 & 3,2" should be alive
		And all other cells should be dead
	
	
	
	
  
