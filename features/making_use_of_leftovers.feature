Feature: Making use of leftovers
As a hobby chef
I want to search for recipes by ingredients
So I can make use of leftovers

Scenario: See all recipes with a given ingredient on search results page
  Given there are these recipes:
  | Name                      | Ingredients |
  | Fried rice                | Rice        |
  | Noodles with tomato sauce | Tomatoes    |
  When I visit the search page
  And I select the ingredient "Tomatoes"
  Then I see "Noodles with tomato sauce" but not "Fried rice"
