json.array!(@bussines) do |bussine|
  json.extract! bussine, :id, :name, :address, :latitude, :longitude
  json.url bussine_url(bussine, format: :json)
end
