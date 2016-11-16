require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "POST create" do
    let(:category) do
      FactoryGirl.create :category
    end

    describe "while not logged in" do
      before(:each) do
        sign_in nil
      end

      it "doesn't allow users to create a recipe" do
        post :create, {recipe: FactoryGirl.attributes_for(:recipe, category_id: category.id)}
        expect(Recipe.count).to eq(0)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "while logged in" do
      before(:each) do
        sign_in
      end

      it "allows users to create a new recipe" do
        post :create, {recipe: FactoryGirl.attributes_for(:recipe, category_id: category.id)}
        expect(Recipe.count).to eq(1)
        expect(response).to redirect_to recipe_path(Recipe.last)
      end
    end
  end
end
