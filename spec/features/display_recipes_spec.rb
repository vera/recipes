require "rails_helper"
require "spec_helper"

feature "Display recipes", :type => :feature do
  let(:category) { create :category }

  before { create :recipe, category: category }

  scenario "See recipes" do
    visit '/categories'
    save_and_open_page

    expect(page).to have_content("Testrezept")
  end
end
