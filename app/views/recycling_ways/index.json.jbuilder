json.array!(@recycling_ways) do |recycling_way|
  json.extract! recycling_way, :id, :title, :description, :subcategory_id, :image_name, :image_url
  json.url recycling_way_url(recycling_way, format: :json)
end
