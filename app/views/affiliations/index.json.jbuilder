json.array!(@affiliations) do |affiliation|
  json.extract! affiliation, :id, :name
  json.url affiliation_url(affiliation, format: :json)
end
