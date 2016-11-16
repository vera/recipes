require "spec_helper"
require "rails_helper"
require 'support/shared_examples/unique_and_present_name'

describe Recipe do
  let(:recipe) do
    FactoryGirl.create :recipe
  end

  it_behaves_like 'a model with unique and present name', :recipe

  describe "validations" do
    it "is invalid without a category" do
      recipe.category_id = nil
      expect(recipe).not_to be_valid
    end
  end
end
