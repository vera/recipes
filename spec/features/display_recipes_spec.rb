require "rails_helper"
require "spec_helper"

feature "Display recipes", :type => :feature do
  before { create :recipe }

  scenario "See recipes" do
    visit '/categories'
    save_and_open_page

    expect(page).to have_content("Testrezept")
  end
end
