json.array!(@recycling_way_images) do |recycling_way_image|
  json.extract! recycling_way_image, :id, :title, :url, :recyclingWay_id
  json.url recycling_way_image_url(recycling_way_image, format: :json)
end
