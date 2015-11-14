class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    authenticate_user
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:title, :price, :info))

    if @product.save
    redirect_to product_path(@product), notice: "Spatula Spawned!!"
    else
    render :new, notice: "Not saved!"
    end
  end

  def show
    @product = Product.find params[:id]
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to products_path
  end


end
