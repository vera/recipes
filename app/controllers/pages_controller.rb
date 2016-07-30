class PagesController < ApplicationController
  def search
    @recipes = Recipe.where("category_id = :cid AND name LIKE :name", cid: params[:category_id], name: "%#{params[:name]}%")
  end

  def info
  end
end
