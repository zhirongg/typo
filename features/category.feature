Feature: Categories
  As a blog user
  In order to organize articles
  I want to be able to make categories for my articles

Background:
  Given the blog is set up
  Given the following categories exist:
  | title           | keyword  | permalink  | description  |
  | firstcategory   | keyword1 | permalink1 | description1 |
  | secondcategory  | keyword2 | permalink1 | description2 |

Scenario: Create new categories as an admin
  Given I am logged into the admin panel
  When I am on the new categories page
  When I fill in "category_name" with "thirdcategory"
  When I fill in "category_description" with "thirddescription"
  When I fill in "category_permalink" with "thirdpermalink"
  When I fill in "category_keywords" with "thirdkeyword"
  And I press "Save"
  Then I should be on the new categories page
  Then I should see "thirdcategory"
  Then I should see "thirddescription"
  Then I should see "thirdpermalink"
  Then I should see "thirdkeyword"

Scenario: Edit existing categories as an admin
  Given I am logged into the admin panel
  When I edit category "secondcategory"
  When I fill in "category_description" with "new description"
  When I fill in "category_permalink" with "new permalink"
  When I fill in "category_keywords" with "new keyword"
  And I press "Save"
  Then I should be on the new categories page
  Then I should see "secondcategory"
  Then I should see "new description"
  Then I should see "new permalink"
  Then I should see "new keyword"

Scenario: Attempt to find a nonexistent category
  Given I am logged into the admin panel
  Then I should not be able to find a nonexistent category

