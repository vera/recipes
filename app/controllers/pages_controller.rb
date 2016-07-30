class PagesController < ApplicationController
  def search
    if params[:category_id].blank?
      @recipes = Recipe.where("name LIKE :name", name: "%#{params[:name]}%")
    else
      @recipes = Recipe.where("category_id = :cid AND name LIKE :name", cid: params[:category_id], name: "%#{params[:name]}%")
    end
  end

  def info
  end
end
