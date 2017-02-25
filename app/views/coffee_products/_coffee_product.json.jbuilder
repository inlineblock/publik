json.extract! coffee_product, :id, :name, :coffee_type_id, :price, :created_at, :updated_at
json.url coffee_product_url(coffee_product, { format: :json })
