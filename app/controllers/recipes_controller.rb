class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path, notice: 'Recipes created successfully'
    else
      render :new
    end
  end

  def destroy; end

  def public_recipes; end


  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
