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
  
  
