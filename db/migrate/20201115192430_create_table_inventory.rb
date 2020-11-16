class CreateTableInventory < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.references :product, foreign_key: true
      t.references :warehouse, foreign_key: true
      t.integer :item_count, default: 0
      t.integer :low_item_threshold, default: 0
      t.index [:product_id, :warehouse_id], unique: true
    end
  end
end
