require "rails_helper"
require "spec_helper"

feature "Display ideas", :type => :feature do
  let(:category) { create :category }

  before { create :idea, category: category }

  scenario "See ideas" do
    visit '/categories'
    save_and_open_page

    expect(page).to have_content("Testidee")
  end
end
