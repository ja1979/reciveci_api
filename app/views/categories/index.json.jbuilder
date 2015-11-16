json.array!(@categories) do |category|
  json.extract! category, :id, :name, :description, :image_name, :image_url
  json.url category_url(category, format: :json)
end
