json.extract! warehouse, :id, :wh_code, :name, :pincode, :max_capactity, :created_at, :updated_at
json.url warehouse_url(warehouse, format: :json)
