class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  rescue NoMethodError
    redirect_to new_user_session_path
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
  end

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

  def destroy
    @recipe = current_user.recipes.find(params[:id])

    if @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe has been removed'
    else
      redirect_to recipes_path, notice: 'Recipes could not be deleted'
    end
  end

  def public_recipes
    @recipes = Recipe.where(public: false).includes(:user, recipe_foods: :food).order(created_at: :desc)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
