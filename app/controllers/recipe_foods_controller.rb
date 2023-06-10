class RecipeFoodsController < ApplicationController
  # RecipeFoods#new ____   GET    /recipes/:recipe_id/ingredients/new
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
    @recipe_food = @recipe.recipe_foods.new
  end

  # RecipeFoods#create ____  POST   /recipes/:recipe_id/ingredients
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_food_params)

    if @recipe_food.save
      flash[:success] = 'Ingredient added successfully'
      redirect_to @recipe
    else
      flash[:error] = 'Error adding ingredient'
      render :new
    end
  end

  # recipe_recipe_food DELETE /recipes/:recipe_id/recipe_foods/:id
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
  
    if @recipe_food.destroy
      flash[:success] = 'Ingredient removed successfully'
      redirect_to @recipe_food.recipe
    else
      flash[:error] = 'Error removing ingredient'
      redirect_to root
    end
  end
end


private

def recipe_food_params
  params.require(:recipe_food).permit(:recipe_id, :food_id, :quantity)
end
