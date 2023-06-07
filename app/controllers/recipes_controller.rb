class RecipesController < ApplicationController
  def index; end

  # recipes#show ___ GET /recipes/:id
  def show
    @recipe = Recipe.find(params[:id])
    @foods = @recipe.foods
  end

  def new; end

  def create; end

  def destroy; end

  def public_recipes; end
end
