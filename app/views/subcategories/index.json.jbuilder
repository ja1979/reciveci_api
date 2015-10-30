json.array!(@subcategories) do |subcategory|
  json.extract! subcategory, :id, :name, :description, :category_id
  json.url subcategory_url(subcategory, format: :json)
end
