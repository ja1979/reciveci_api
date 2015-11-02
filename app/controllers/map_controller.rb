class MapController < ApplicationController


  def routes
    @line_strings = LineString.all


    @geojson = Array.new

    @line_strings.each do |line_string|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'LineString',
          coordinates: eval(line_string.coordinates)
        },
        properties: {
          :'route-name' => line_string.route.name,
          schedule: line_string.route.schedule,
          :'line_string-name' => line_string.name,
          :'waste_picker-name' => line_string.route.waste_picker.name,
          :'waste_picker-id' => line_string.route.waste_picker.id,
          :'waste_picker-image_url' => line_string.route.waste_picker.image_url,
          :'color' => line_string.route.color,
          :'weight' => 10,
          :'opacity' => 0.4,
          popup: "<img src='#{line_string.route.waste_picker.image_url}'/><br><strong>Reciclador:</strong> <a target='_blank' href='waste_pickers/#{line_string.route.waste_picker.id}'>#{line_string.route.waste_picker.name}</a><br><strong>Horario:</strong> #{line_string.route.schedule}"
        }
      }
    end

    respond_to do |format|
      format.json { render json: @geojson }
    end
  end

end
