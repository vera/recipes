require "rails_helper"

describe "Recipe requests", type: :request do
  describe "POST create" do
    let(:category) do
      FactoryGirl.create :category
    end

    let(:user) do
      FactoryGirl.create :user, confirmed_at: Time.new()
    end

    describe "while not signed in" do
      it "doesn't allow users to create a recipe" do
        post "/recipes", {recipe: FactoryGirl.attributes_for(:recipe, category_id: category.id)}
        expect(Recipe.count).to eq(0)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "while signed in" do
      before(:each) do
        sign_in user
      end

      it "allows users to create a new recipe" do
        post "/recipes", {recipe: FactoryGirl.attributes_for(:recipe, category_id: category.id)}
        expect(Recipe.count).to eq(1)
        expect(response).to redirect_to recipe_path(Recipe.last)
      end
    end
  end
end
