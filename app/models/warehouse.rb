class Warehouse < ApplicationRecord
  # wh_code:string name:string pincode:integer max_capactity:integer


  validates :wh_code, uniqueness: true, length: { in: 4..16, message: "Warehouse Code should be 4 to 16 characters" }
  validates :pincode, uniqueness: true, format: { with: /\A\d{6}\z/, message: "must be 6 digitss" }
  validates_presence_of :name
  validates :max_capactity, numericality: true 
  after_create_commit :create_initial_inventory

  def create_initial_inventory
    # byebug
    Product.all.each do |p|
      # byebug
      self.inventories.build(product: p, low_item_threshold: 10)
    end
    self.save!
  end

  has_many :inventories, dependent: :destroy
  has_many :products, through: :inventories
end
