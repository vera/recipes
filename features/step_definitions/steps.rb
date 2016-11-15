def createRecipes(table)
  table.hashes.each do |row|

    ingredients = Array.new

    if !row["Ingredients"].blank?
      row["Ingredients"].split(",").each do |ingredient_name|
        ingredient = create :ingredient, {
          name: ingredient_name
        }
        ingredients << ingredient
      end
    end

    recipe = create :recipe, {
      name: row["Name"],
      preparation_time: row["Preparation time (min)"],
      servings: row["Number of servings"],
      ingredients: ingredients
    }
  end
end

#####################################################
#                                                   #
# GIVEN                                             #
#                                                   #
#####################################################

Given(/^there is a recipe/) do |table|
  createRecipes(table)
end

Given(/^there are these recipes:$/) do |table|
  createRecipes(table)
end

Given(/^there is the category "([^"]*)"$/) do |name|
  @category = Category.new(name: name)
  @category.save!
end

Given(/^I am logged in$/) do
  email = 'testuser@example.com'
  password = 'secret'
  testuser = User.new(:email => email, :password => password, :password_confirmation => password)
  testuser.skip_confirmation!
  testuser.save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"
end

Given(/^I am not logged in$/) do
end

#####################################################
#                                                   #
# WHEN                                              #
#                                                   #
#####################################################

When(/^I visit the landing page$/) do
  visit root_path
end

When(/^I click on the picture labeled with "([^"]*)"$/) do |recipe_name|
  @recipe = Recipe.find_by(name: recipe_name)
  image = find(".recipe-picture-#{@recipe.id}")
  image.click
end

When(/^I visit the search page$/) do
  visit '/pages/search'
end

When(/^I select the ingredient "([^"]*)"$/) do |ingredient|
  page.select ingredient, :from => 'ingredient_id'
  find('input[name="commit"]').click
end

When(/^I visit the weekplanner page$/) do
  visit '/pages/weekplanner'
end

Then(/^I see the current day and the following six days$/) do
  time = Time.new
  days = Array.new
  for i in 0..6
    days << (time + 24*60*60*i).strftime("%d (%a)")
    expect(page).to have_text(days.at(i))
  end
end

When(/^I drop the recipe labeled with "([^"]*)" into the day with number "([^"]*)"$/) do |recipe_name, day|
  @recipe = Recipe.find_by(name: recipe_name)
  page.execute_script("window.addRecipe($('.recipe-#{@recipe.id}'), $('#weekday#{day}'))")
  sleep(1)
end

When(/^I press the "([^"]*)" button$/) do |text|
  page.click_button(text)
end

When(/^I click the "Add recipe" link of that category$/) do
  click_on 'add-recipe-'+@category.id.to_s
end

When(/^I input the recipe:$/) do |table|
  table.hashes.each do |row|
    @recipe = row
    fill_in 'Name', with: @recipe["Name"]
    fill_in 'Description', with: @recipe["Description"]
  end
end

#####################################################
#                                                   #
# THEN                                              #
#                                                   #
#####################################################

Then(/^I see the preparation time$/) do
  tr_element = find("tr", :text => /Preparation time:/)
  expect(tr_element).to have_text(@recipe.preparation_time)
end

Then(/^I see the number of servings$/) do
  tr_element = find("tr", :text => /Number of servings:/)
  expect(tr_element).to have_text(@recipe.servings)
end

Then(/^I see "([^"]*)" but not "([^"]*)"$/) do |matchingRecipe, notMatchingRecipe|
  expect(page).to have_text(matchingRecipe)
  expect(page).not_to have_text(notMatchingRecipe)
end

Then(/^I see the list of ingredients$/) do
  tr_element = find("tr", :text => /Ingredients:/)
  @recipe.ingredients.each do |ingredient|
    expect(tr_element).to have_text(ingredient.name)
  end
end

Then(/^I see "([^"]*)" in the shopping list$/) do |expectedText|
  shopping_list = find(".shopping_list")
  expect(shopping_list).to have_text(expectedText)
end

Then(/^I don't see "([^"]*)" in the shopping list$/) do |notExpectedText|
  shopping_list = find(".shopping_list")
  expect(shopping_list).not_to have_text(notExpectedText)
end

Then(/^I see the recipe's details$/) do
  expect(page).to have_text(@recipe["Name"])
  expect(page).to have_text(@recipe["Description"])
end

Then(/^the recipe is saved to the database$/) do
  expect(Recipe.all.count).to equal(1)
end

Then(/^I don't see the "([^"]*)" link of that category$/) do |arg1|
  expect(page).not_to have_link('', :href => '/categories/'+@category.id.to_s+'/recipes/new')
end
