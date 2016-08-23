class PagesController < ApplicationController
  def search
    @minPreparationTime = Recipe.minimum(:preparation_time)
    @maxPreparationTime = Recipe.maximum(:preparation_time)
    @minPreparationTimeSelected = params[:preparation_time_min] || @minPreparationTime
    @maxPreparationTimeSelected = params[:preparation_time_max] || @maxPreparationTime

    @recipes = Recipe.where("recipes.name LIKE :name AND
                                (
                                    (
                                    preparation_time >= :preparation_time_min AND
                                    preparation_time <= :preparation_time_max
                                    )
                                  OR preparation_time IS NULL
                                )",
                                name: "%#{params[:name]}%",
                                preparation_time_min: @minPreparationTimeSelected,
                                preparation_time_max: @maxPreparationTimeSelected).distinct

    if !params[:category_id].blank?
      @recipes = @recipes.where("category_id IN (:cid)", cid: params[:category_id])
    end

    if !params[:ingredient_id].blank?
      @recipes = @recipes.joins(:ingredients).where("ingredient_id IN (:iid)", iid: params[:ingredient_id])
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def info
  end
end
