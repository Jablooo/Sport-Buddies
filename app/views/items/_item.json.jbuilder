json.extract! item, :id, :photo_data, :name, :description, :selling_price, :renting_price, :quantity, :user_id, :created_at, :updated_at
json.url item_url(item, format: :json)
