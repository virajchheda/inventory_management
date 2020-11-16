class ProductsController < ApplicationController

  before_action :set_product, only: [:edit]
  
  def index
    @products = Product.paginate(:page=>params[:page], per_page: 20).includes(inventories: :warehouse)
    @warehouses = Warehouse.all
  end

  def edit
  end

  private

  def set_product 
    @product = Product.includes(inventories: :warehouse).find_by_id(params[:id])
  end

end
