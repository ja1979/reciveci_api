json.array!(@rates) do |rate|
  json.extract! rate, :id, :title, :description, :image_name, :image_url
  json.url rate_url(rate, format: :json)
end
