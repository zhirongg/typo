Feature: Merge articles
  As a blog administrator
  In order to save space on my blog
  I want to be able to merge two or more single articles

  Background:
    Given the blog is set up


  Scenario: Successfully merge articles
    Given I am logged into the admin panel
    And I am on the article page
		Then I should see "Merge Articles"
		And I should see "Article ID"
		And I should see the "Merge" button
    When I fill in the following:
      | article_id     | 5002       |
      | Title          | testmerge1 |
      | Content        | Nice guy   |
		And I click the "Publish" button
		Then I should be on the /admin/content page
		And 
		

    When I fill in "article_ID" with 890
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"



Scenarios: To do this properly, we want to keep the following in mind:

    A non-admin cannot merge articles.

    When articles are merged, the merged article should contain the text of both previous articles.

    When articles are merged, the merged article should have one author (either one of the authors of the original article).  

    Comments on each of the two original articles need to all carry over and point to the new, merged article.

    The title of the new article should be the title from either one of the merged articles.



