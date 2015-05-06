class ProductsController < ApplicationController

  def index
    @products = Product.order(:row_order) #.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def move_up
    @product = Product.find(params[:id])

    @product.update_attribute :row_order_position, :up

    redirect_to :back
  end

  def move_down
    @product = Product.find(params[:id])

    @product.update_attribute :row_order_position, :down

    redirect_to :back
  end

end
