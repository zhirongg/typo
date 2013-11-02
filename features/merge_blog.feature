Feature: Merge articles
  As a blog administrator
  In order to save space on my blog
  I want to be able to merge two or more single articles

  Background:
    Given the blog is set up

And the following articles exist:
		| title           | author        | body                                         | published | created_at |
		| post number one | First Author  | The text in the first blog post.             | true      | 2013/11/02 |
		| post number two | Second Author | Second body text in second blog post         | true      | 2013/11/02 |
And the following users exist:
		| login         | password         | email                    | name           | profile_id |
		| publisher     | publisher_pw     | publisher@domain.org     | Blog Publisher | 2          |
		| administrator | administrator_pw | administrator@domain.org | Blog Admin     | 1          |
And the following feedback exist:
		| title           | author           | body                            | article_id |
		| post number one | First commenter  | The comment for post 1.         | 45         |
		| post number two | Second Author    | the comment for post 2.         | 46         |
  
Scenario: An admin can see the option to merge articles
	Given I am logged into the admin panel as "administrator"
	And I visit the the edit page for "post number one"
	Then I should see "Merge Articles"

Scenario: A non-admin cannot see the option to merge articles
	Given I am logged into the admin panel as "publisher"
	And I visit the the edit page for "post number one"
	Then I should not see "Merge Articles"

Scenario: Merged article should contain text of both articles
	Given I am logged into the admin panel as "administrator"
	And I visit the the edit page for "post number one"
	And I should see "The text in the first blog post."
	And I attempt to merge with "post number two"
	And I visit the the edit page for "post number one"
	Then I should see "The text in the first blog post.Second body text in second blog post"

Scenario: Merged article page should contain feedback of both articles
  Given I am logged into the admin panel as "administrator"
  And I visit the the edit page for "post number one"
	And I attempt to merge with "post number two"
  And I visit the show page for "post number one"

  
