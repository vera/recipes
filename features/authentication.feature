Feature: User authentication

Scenario: Add new recipe to a category while logged in
  Given I am logged in
  And there is the category "Example category"
  When I visit the landing page
  And I click the "Add recipe" link of that category
  And I input the recipe:
  | Name                      | Description |
  | Salad                     | Healthy     |
  And I press the "Create Recipe" button
  Then the recipe is saved to the database
  And I see the recipe's details

Scenario: Add new recipe while not logged in
  Given I am not logged in
  And there is the category "Example category"
  When I visit the landing page
  Then I don't see the "Add recipe" link of that category
