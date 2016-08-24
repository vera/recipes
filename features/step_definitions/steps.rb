def createRecipes(table)
  table.hashes.each do |row|
    recipe = create :recipe, {
      name: row["Name"],
      preparation_time: row["Preparation time (min)"],
      servings: row["Number of servings"]
    }

    if !row["Ingredients"].blank?
      row["Ingredients"].split(",").each do |ingredient_name|
        ingredient = create :ingredient, {
          name: ingredient_name
        }
        recipe.ingredients << ingredient
      end
      recipe.save
    end
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
