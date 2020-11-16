class InventoriesController < ApplicationController

  before_action :set_inventory, only: [:edit, :update]
  
  def index
    @inventories = Inventory.all
  end

  def edit
  end

  def update
    @inventory.update(updated_params)
    respond_to do |format|
      format.js { render file: '/inventories/update.js', :content_type => 'text/javascript'}
    end
  end

  private

  def set_inventory 
    @inventory = Inventory.find_by_id(params[:id])
  end

  def updated_params
    params.require(:inventory).permit(:item_count, :low_item_threshold)
  end


end
