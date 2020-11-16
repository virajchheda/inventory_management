class ProductsController < ApplicationController

  before_action :set_product, only: [:edit]
  
  def index
    @products = Product.all.includes(:inventories)
    @warehouses = Warehouse.all.includes(:inventories)
  end

  def edit
  end

  private

  def set_product 
    @product = Product.find_by_id(params[:id])
  end

end
