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

    if @recipe_food.save
      flash[:success] = "Ingredient added successfully"
      redirect_to @recipe
    else
      flash[:error] = "Error adding ingredient"
      render :new
    end
  end
end

def edit

end

def update

end

private

def recipe_food_params
  params.permit(:food_id, :quantity)
end
