include Utils

class MapController < ApplicationController
  load_and_authorize_resource :except => [:routes,:business,:affiliations]

  after_filter :cors_set_access_control_headers


  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end


  def routes
    
    @line_strings = LineString.all


    #url_prefix = request.protocol + request.host + ":" + request.port.to_s + "/"
    url_prefix = serverUrl(request)


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
          :'waste_picker-image_url' => url_prefix + line_string.route.waste_picker.image_url,
          :'waste_picker-message' => line_string.route.waste_picker.message,
          :'waste_picker-background' => line_string.route.waste_picker.background,
          :'waste_picker-birth_date' => line_string.route.waste_picker.birth_date,
          :'waste_picker-start_date' => line_string.route.waste_picker.start_date,
          :'affiliation-name' => (line_string.route.waste_picker.affiliation.name unless line_string.route.waste_picker.affiliation == nil),
          :'color' => line_string.route.color,
          :'weight' => 15,
          :'opacity' => 0.4,
          popup: "<img src='#{url_prefix}#{line_string.route.waste_picker.image_url}'/>" +
                 "<br>" + 
                 "<strong>Reciclador:</strong> " +
                 "<a target='_blank' href='waste_pickers/#{line_string.route.waste_picker.id}'>#{line_string.route.waste_picker.name}</a>" +
                 "<br><strong>Horario:</strong> " +
                 "#{line_string.route.schedule}"
        }
      }
    end

    respond_to do |format|
      format.json { render json: @geojson }
    end
  end


  def business

    @businesses= Business.all

    @geojson_x = Array.new


    @businesses.each do |business|
      @geojson_x << {

        
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates:[business.longitude,business.latitude]
          },
        properties: {
          :'name' => business.name,
          
          :'address' => business.address,
          
          
        }
      }

    end

    respond_to do |format|
      format.json { render json: @geojson_x }
      
    end
end


    def affiliations

      @affiliations= Affiliation.all

      @geojson_y = Array.new


      @affiliations.each do |affiliation|
        if(affiliation.publish==true)
          @geojson_y << {
            type: 'Feature',
            geometry: {
              type: 'Point',
              coordinates:[affiliation.longitud,affiliation.latitude]
              },
            properties: {
              :'name' => affiliation.name,
          
              :'address' => affiliation.direccion,
            }
          }

        end
      end

          respond_to do |format|
            format.json { render json: @geojson_y }
      
          end

end











end
