json.array!(@waste_pickers) do |waste_picker|
  json.extract! waste_picker, :id, :name, :birth_date, :start_date, :background, :message, :routes
  json.url waste_picker_url(waste_picker, format: :json)
end
