class FoodsController < ApplicationController
  def index; end

  def new; end

  def create; end

  def destroy; end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    if @food.update(food_params)
      redirect_to @food, notice: 'Food was successfully updated.'
    else
      render :edit
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
