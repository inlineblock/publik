class CoffeeProductsController < ApplicationController
  before_action :set_coffee_product, only: [:show, :edit, :update, :destroy]

  # GET /coffee_products
  # GET /coffee_products.json
  def index
    @coffee_products = CoffeeProduct.all
  end

  # GET /coffee_products/1
  # GET /coffee_products/1.json
  def show
  end

  # GET /coffee_products/new
  def new
    @coffee_product = CoffeeProduct.new
  end

  # GET /coffee_products/1/edit
  def edit
  end

  # POST /coffee_products
  # POST /coffee_products.json
  def create
    @coffee_product = CoffeeProduct.new(coffee_product_params)

    respond_to do |format|
      if @coffee_product.save
        format.html { redirect_to @coffee_product, notice: 'Coffee product was successfully created.' }
        format.json { render :show, status: :created, location: @coffee_product }
      else
        format.html { render :new }
        format.json { render json: @coffee_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffee_products/1
  # PATCH/PUT /coffee_products/1.json
  def update
    respond_to do |format|
      if @coffee_product.update(coffee_product_params)
        format.html { redirect_to @coffee_product, notice: 'Coffee product was successfully updated.' }
        format.json { render :show, status: :ok, location: @coffee_product }
      else
        format.html { render :edit }
        format.json { render json: @coffee_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffee_products/1
  # DELETE /coffee_products/1.json
  def destroy
    @coffee_product.destroy
    respond_to do |format|
      format.html { redirect_to coffee_products_url, notice: 'Coffee product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee_product
      @coffee_product = CoffeeProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coffee_product_params
      params.require(:coffee_product).permit(:name, :coffee_type_id, :price)
    end
end
