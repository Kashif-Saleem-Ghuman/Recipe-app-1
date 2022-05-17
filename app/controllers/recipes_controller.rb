class RecipesController < ApplicationController
  def index
    @current_user = current_user
    @recipes = @current_user.recipes
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
    @ingredients = @recipe.foods
  end

  def toggle_public
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @recipe.public = !@recipe.public

    if @recipe.save
    redirect_to recipe_path(@recipe.id), notice: 'Recipe updated'
    end
  end

  def destroy
    @recipe = Recipe.find_by_id(params[:id])
    redirect_to recipes_path if @recipe.destroy
  end
end
