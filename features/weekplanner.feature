Feature: Implement a weekplanner for meals
As a hobby chef
I want to be able to plan meals for the days of the current week
So I can buy the ingredients beforehand

Scenario: See the days of the current week
  When I visit the weekplanner page
  Then I see the current day and the following six days

@javascript
Scenario: Plan the meals of the current week and create a shopping list
  Given there are these recipes:
  | Name                      | Ingredients |
  | Fried rice                | Rice        |
  | Noodles with tomato sauce | Tomatoes    |
  | Salad                     | Lettuce     |
  When I visit the weekplanner page
  And I drop the recipe labeled with "Fried rice" into the day with number "1"
  And I drop the recipe labeled with "Salad" into the day with number "5"
  Then I see "Rice" in the shopping list
  And I see "Lettuce" in the shopping list
  And I don't see "Tomatoes" in the shopping list
