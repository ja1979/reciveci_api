json.array!(@routes) do |route|
  json.extract! route, :id, :name, :schedule, :waste_picker, :color, :line_strings
  json.url route_url(route, format: :json)
end
