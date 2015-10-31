json.array!(@line_strings) do |line_string|
  json.extract! line_string, :id, :name, :coordinates, :route
  json.url line_string_url(line_string, format: :json)
end
