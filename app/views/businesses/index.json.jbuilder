json.array!(@businesses) do |business|
  json.extract! business, :id, :name, :address, :latitude, :longitude
  json.url business_url(business, format: :json)
end
