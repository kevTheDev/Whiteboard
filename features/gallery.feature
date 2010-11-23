Feature: Publishing/Gallery Descriptions

As a owner 
I want to be able to publish my drawing board
So that everyone can see my work

Scenario: Viewing the gallery of a whiteBoard
	Given whiteboard 1 exists 
	And gallery 1 exists
  When I go to view gallery page
  Then I should see "whiteboard 1"
  
Scenario: No Gallery for a unpublished whiteBoard
	Given whiteboard 1 exists
	When I go to view gallery page
	Then I should not see "whiteboard 1"
	
Scenario: participants can post comments on gallery (anonymously)
	Given gallery 1 exists
	When I go to view gallery 1
	And I fill in "comment_content_1" with "hello"
	And I press "Submit"
	Then I should see "hello"
	
Scenario: cannot supply empty comment
	Given gallery 1 exists
	When I go to view gallery 1
	And I fill in "comment_content_1" with " "
	And I press "Submit"
	Then I should see "can't be blank"
