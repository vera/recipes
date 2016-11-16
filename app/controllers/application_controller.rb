class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_categories

  def set_categories
    @categories_dd = Category.order("name ASC")
  end

  def get_search_results(name, minPreparationTimeSelected, maxPreparationTimeSelected, category_id, ingredient_id)
    recipes = Recipe.where("recipes.name LIKE :name AND
                                (
                                    (
                                    preparation_time >= :preparation_time_min AND
                                    preparation_time <= :preparation_time_max
                                    )
                                  OR preparation_time IS NULL
                                )",
                                name: "%#{name}%",
                                preparation_time_min: minPreparationTimeSelected,
                                preparation_time_max: maxPreparationTimeSelected).distinct

    if !category_id.blank?
      recipes = recipes.where("category_id IN (:cid)", cid: category_id)
    end

    if !ingredient_id.blank?
      recipes = recipes.joins(:ingredients).where("ingredient_id IN (:iid)", iid: ingredient_id)
    end

    return recipes
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => exception.message
  end
end
