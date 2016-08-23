Given(/^there is a recipe/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |row|
    create :recipe, {
      name: row["Name"],
      preparation_time: row["Preparation time (min)"],
      servings: row["Number of servings"]
    }
  end
end

When(/^I visit the landing page$/) do
  visit '/'
end

When(/^I click on the picture labeled with "([^"]*)"$/) do |recipe_name|
  @recipe = Recipe.find_by(name: recipe_name)
  image = find(".recipe-picture-#{@recipe.id}")
  image.click
end

Then(/^I see the preparation time$/) do
  tr_element = find("tr", :text => /Preparation time:/)
  expect(tr_element).to have_text(@recipe.preparation_time)
end

Then(/^I see the number of servings$/) do
  tr_element = find("tr", :text => /Number of servings:/)
  expect(tr_element).to have_text(@recipe.servings)
end
