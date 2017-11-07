json.extract! profile, :id, :user_id, :avatar_data, :first_name, :last_name, :sex, :DOB, :street, :postcode, :state, :country, :latitude, :longitude, :created_at, :updated_at
json.url profile_url(profile, format: :json)
