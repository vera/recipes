require "rails_helper"

feature "Group recipes by category", :type => :feature do
  let(:category1) { create :category, name: "Wow much category" }
  let(:category2) { create :category }

  # 'given' doesn't work for me?
  # given "given 3 ideas and 2 categories"  do
  before {
    create :recipe, category: category1, name: "Very Recipe"
    create :recipe, category: category2, name: "So much other category"
    create :recipe, category: category1, name: "Recipe Wow"
  }
  # end

  scenario "See categorized recipes" do
    visit '/categories'

    grouping_element = find('.category', :text => /Wow much category/)
    within(grouping_element) do
      expect(page).to have_text("Very Recipe")
      expect(page).to have_text("Recipe Wow")
      # BUT
      expect(page).not_to have_text("So much other category")
    end
  end
end
