Feature: Merge Articles
  As an admin
  In order to merge similar topics
  I want to be able to merge similar articles

Background: articles in database
  Given the following articles exist:
    | id    | title     | body       | author | published |
    | 100   | Yo        | food       | Elmer  | true      |
    | 101   | fizz      | hunger     | Elmer  | true      |
    | 102   | buzz      | more food  | Edwan  | true      |

Scenario: Merge two articles

  Given the blog is set up 
  And I am logged into the admin panel
  
  And I am on the admin content page
  Then I should see "buzz"
  And I follow "Yo"
  And I fill in "merge_with" with converted value of "buzz"
  And I press "Merge With This Article"
  Then I should be on the admin content page
  And I should not see "buzz"
  When I follow "Yo"
  Then I should see "more food"

Scenario: Merge three articles
  Given the blog is set up 
  And I am logged into the admin panel
  When I am on the admin content page
  And I follow "buzz"
  And I fill in "merge_with" with converted value of "Yo"
  And I press "Merge With This Article"
  And I follow "buzz"
  And I fill in "merge_with" with converted value of "fizz"
  And I press "Merge With This Article"
  And I follow "buzz"
  Then I should see "more food"
  And I should see "hunger"
  And I should see "food"