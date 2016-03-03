json.array!(@examples) do |example|
  json.extract! example, :id, :name, :enabled, :subcategory_id
  json.url example_url(example, format: :json)
end
