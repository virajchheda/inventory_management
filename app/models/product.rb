class Product < ApplicationRecord

  validates :sku_code, uniqueness: true, length: { is: 8 }
  validates :price, numericality: { greater_than: 0 }
  validates_presence_of :sku_code, :name, :price
  before_save {self.sku_code.upcase!}

  has_many :inventories, dependent: :destroy
  has_many :warehouses, through: :inventories
end
