# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


60.times do |i|
  p = Product.new
  p.sku_code = "PR" + SecureRandom.hex(3)
  p.name = "Product #{i+1}"
  p.price = rand(50..100)
  p.save
end

[{name: 'Mumbai', wh_code:"MUMBAI", pincode: "400001"}, {name: 'New Delhi', wh_code: "NEWDELHI", pincode: "110001"}, {name: 'Banglore', wh_code:"BANGLR", pincode:"560001"}].each do |w|
  wh = Warehouse.new
  wh.name = w[:name]
  wh.wh_code = w[:wh_code]
  wh.pincode = w[:pincode]
  wh.max_capactity = rand(500..1000)
  wh.save!
  Product.all.each do |p|
    p.inventories.create!(low_item_threshold: rand(5..10), warehouse: wh)
  end
end

#for mumbai
wh = Warehouse.find_by_name("Mumbai")
wh.inventories.each do  |inv|
  inv.item_count = rand((inv.low_item_threshold + 1) ..15)
  inv.save!
end

#for delhi (60/3 = 20) and banglore(20/2 = 10)

[{name: 'New Delhi', count: 20}, {name: 'Banglore', count: 10}].each do |w|
  
  wh = Warehouse.find_by_name(w[:name])
  i = 1
  wh.inventories.each do |inv|
    if i <= w[:count]
      inv.item_count = rand(0..inv.low_item_threshold - 1)
    else
      inv.item_count = rand((inv.low_item_threshold + 1) ..15)
    end
    inv.save!
  end
end
