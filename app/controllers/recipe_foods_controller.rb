class RecipeFoodsController < ApplicationController
  # RecipeFoods#new ____   GET    /recipes/:recipe_id/ingredients/new
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  # RecipeFoods#create ____  POST   /recipes/:recipe_id/ingredients
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(recipe_food_params)

    if @recipe_food.persisted?
      flash[:success] = "Ingredient added successfully"
      redirect_to @recipe
    else
      flash[:error] = "Error adding ingredient"
      render :new
    end
  end
end

private

def recipe_food_params
  params.require(:recipe_food).permit(:food_id, :quantity)
end
