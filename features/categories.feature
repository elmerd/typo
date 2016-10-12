Feature: Add and Edit Blogging Categories
    As an author, 
    In order to keep track of my blogs better, 
    I want to place them in different categories.
    
    Background:
      Given the blog is set up
      And I am logged into the admin panel
    
    Scenario:
      When I follow "Categories"
      Then I should see "Categories"
  