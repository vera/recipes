class PagesController < ApplicationController
  def search
    @minPreparationTime = Recipe.minimum(:preparation_time)
    @maxPreparationTime = Recipe.maximum(:preparation_time)
    @minPreparationTimeSelected = params[:preparation_time_min] || @minPreparationTime
    @maxPreparationTimeSelected = params[:preparation_time_max] || @maxPreparationTime

    @recipes = get_search_results(params[:name], @minPreparationTimeSelected, @maxPreparationTimeSelected, params[:category_id], params[:ingredient_id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def info
  end

  def weekplanner
    @minPreparationTime = Recipe.minimum(:preparation_time)
    @maxPreparationTime = Recipe.maximum(:preparation_time)

    @recipes = Recipe.all

    time = Time.new
    @days = Array.new

    @days_strings = Array.new
    for i in 0..6
      @days << (time + 24*60*60*i)
      @days_strings << (time + 24*60*60*i).strftime("%d (%a)")
    end

    @week = time.strftime("%W (" + @days.at(0).strftime("%d. %b") + " - " + @days.at(6).strftime("%d. %b") + ")")

    @shopping_list = Array.new
  end

  def update_results
    @recipes = get_search_results(params[:name], params[:preparation_time_min], params[:preparation_time_max], params[:category_id], params[:ingredient_id])
  end

  def update_shopping_list
    @shopping_list = Array.new

    recipes = params[:shopping_list]
    recipes.each do |recipe_id|
      recipe = Recipe.find(recipe_id)
      recipe.ingredients.each do |ingredient|
        @shopping_list << ingredient
      end
    end
  end
end
