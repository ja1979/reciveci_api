json.array!(@recycling_ways) do |recycling_way|
  json.extract! recycling_way, :id, :title, :description, :subcategory_id
  json.url recycling_way_url(recycling_way, format: :json)
end
