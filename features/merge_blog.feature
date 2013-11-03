Feature: Merge articles
  As a blog admin1
  In order to save space on my blog
  I want to be able to merge two or more single articles

  Background:
    Given the blog is set up

And the following articles exist:
		| title           | author        | body                |
		| post number one | bloggerone    | First body text.    |
		| post number two | bloggertwo    | Second body text.   |
And the following users exist:
		| login         | password            | email                    | name           | profile_id |
		| bloguser1     | bloguser1-pw123     | bloguser1@domain.org     | Mr.Bloguser    | 2          |
		| admin1        | admin1-pw123        | admin1@domain.org        | Mr.Blogadmin   | 1          |

  
Scenario: An admin can see the option to merge articles
	Given I am logged into the admin panel as "admin1"
	And I visit the the edit page for "post number one"
	Then I should see "Merge Articles"

Scenario: A non-admin cannot merge two articles
	Given I am logged into the admin panel as "bloguser1"
	And I visit the the edit page for "post number one"
	Then I should not see "Merge Articles"

Scenario: When articles are merged, the merged article should contain the text of both previous articles
	Given I am logged into the admin panel as "admin1"
	And I visit the the edit page for "post number one"
	And I should see "First body text."
	And I attempt to merge with "post number two"
	Then "Second body text." should exist in the body of "post number one"


  
