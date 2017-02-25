class CoffeeTypesController < ApplicationController
  before_action :set_coffee_type, only: [:show, :update, :destroy]

  def index
    @coffee_types = CoffeeType.all
  end

  def show
  end

  def create
    @coffee_type = CoffeeType.create!(coffee_type_params)
    render :show
  end

  def update
    @coffee_type.update!(coffee_type_params)
    render :show
  end

  def destroy
    @coffee_type.destroy!
    head :no_content
  end

private

  def set_coffee_type
    @coffee_type = CoffeeType.find_by_id!(params.require(:id))
  end

  def coffee_type_params
    params.require(:coffee_type).permit(:name)
  end
end
