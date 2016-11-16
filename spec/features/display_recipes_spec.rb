require "rails_helper"
require "spec_helper"

feature "Display recipes", :type => :feature do
  let(:recipe) do
    create :recipe
  end

  scenario "See recipes" do
    recipe
    visit '/categories'
    expect(page).to have_content(recipe.name)
  end
end
