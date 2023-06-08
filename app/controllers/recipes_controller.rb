class RecipesController < ApplicationController
  load_and_authorize_resource

  # Errors handling
  rescue_from ActiveRecord::RecordNotFound do |exception|
    flash[:error] = "Recipe not found."
    redirect_to recipes_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You are not authorized to perform this action."
    redirect_to recipes_path
  end

  def index; end

  # recipes#show ___ GET /recipes/:id
  def show
    @recipe = Recipe.includes(:foods).find(params[:id])
    @foods = @recipe.foods
  end

  def new; end

  def create; end

  def destroy; end

  def public_recipes; end

  # recipes#toggle_public ____ PATCH /recipes/:id/toggle_public
  def toggle_public
    @recipe = Recipe.find(params[:id])
    authorize! :toggle_public, @recipe

    @recipe.toggle_public
    redirect_to @recipe
  end
end
