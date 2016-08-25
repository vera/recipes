require "rails_helper"
require "spec_helper"

feature "Display recipes", :type => :feature do
  before { create :recipe }

  scenario "See recipes" do
    visit '/categories'

    expect(page).to have_content("Recipe1")
  end
end
