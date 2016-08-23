Feature: Enter the number of servings
As a professional chef
I want to enter how many people can be served with the recipe
So people can scale down or up more easily

Scenario: See number of servings on the recipe page
  Given there is a recipe with a number of servings:
  | Name      | Number of servings |
  | Casserole | 4                  |
  When I visit the landing page
  And I click on the picture labeled with "Casserole"
  Then I see the number of servings
