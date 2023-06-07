class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
  rescue NoMethodError
    redirect_to new_user_session_path
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    
    if @food.save
      redirect_to foods_path, notice: 'Food created successfully'
    else
      render :new
    end
    
  rescue NoMethodError
    redirect_to root_path
  end

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

  def destroy
    @food = current_user.foods.find(params[:id])

    if @food.destroy
      redirect_to foods_path, notice: 'Food deleted successfully'
    else
      redirect_to foods_path, notice: 'Something went wrong food could not be deleted'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
