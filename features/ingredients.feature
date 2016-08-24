Feature: Display ingredients
As a hobby chef
I want to see the required ingredients for a recipe
In order to buy them in the supermarket

Scenario: See all required ingredients for a recipe
  Given there is a recipe with a list of ingredients:
  | Name                      | Ingredients           |
  | Fried rice                | Rice, Oil, Vegetables |
  When I visit the landing page
  And I click on the picture labeled with "Fried rice"
  Then I see the list of ingredients
