class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse

  # validates_presence_of :item_count, :low_item_threshold
  validates :item_count, numericality: { greater_than: -1, message: "cannot be in negative" }
  validates :low_item_threshold, numericality: { greater_than: -1, message: "cannot be in negative"}

  scope :order_by_warehouse, -> { order(warehouse_id: :asc) }
end
