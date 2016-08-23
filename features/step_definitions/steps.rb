def createRecipes(table)
  table.hashes.each do |row|
    ingredient = create :ingredient, {
      name: row["Ingredients"]
    }

    recipe = create :recipe, {
      name: row["Name"],
      preparation_time: row["Preparation time (min)"],
      servings: row["Number of servings"]
    }

    recipe.ingredients << ingredient
    recipe.save
  end
end

Given(/^there is a recipe/) do |table|
  createRecipes(table)
end

Given(/^there are these recipes:$/) do |table|
  createRecipes(table)
end

When(/^I visit the landing page$/) do
  visit '/'
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
