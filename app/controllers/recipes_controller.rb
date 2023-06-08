class RecipesController < ApplicationController
  load_and_authorize_resource

  # Errors handling
  rescue_from ActiveRecord::RecordNotFound do |_exception|
    flash[:error] = 'Recipe not found.'
    redirect_to recipes_path
  end

  rescue_from CanCan::AccessDenied do |_exception|
    flash[:error] = 'You are not authorized to perform this action.'
    redirect_to recipes_path
  end

  # recipes#show ___ GET /recipes/:id
  def show
    @recipe = Recipe.includes(:foods).find(params[:id])
    @foods = @recipe.foods
  end

  def index
    @recipes = current_user.recipes
  rescue NoMethodError
    redirect_to new_user_session_path
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
      redirect_to recipes_path, notice: 'Recipes coould not be deleted'
    end
  end

  def public_recipes; end

  # recipes#toggle_public ____ PATCH /recipes/:id/toggle_public
  def toggle_public
    @recipe = Recipe.find(params[:id])
    authorize! :toggle_public, @recipe

    @recipe.toggle_public
    redirect_to @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
