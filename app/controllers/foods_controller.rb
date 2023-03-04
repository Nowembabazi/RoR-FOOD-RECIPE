class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
    @foods = Food.new

    render :new
  end

  def create
    @new_food = Food.new(name: params[:name],
                         measurement: params[:measurement],
                         price: params[:unit_price],
                         quantity: params[:quantity],
                         user_id: current_user.id)

    @new_food.save

    redirect_to foods_path
  end

  def destroy
    Food.find(params[:id]).destroy
    redirect_to foods_path
  end
end
