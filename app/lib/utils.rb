module Utils

	def serverUrl(request)
		request.protocol + request.host + ":" + request.port.to_s + "/"
	end

	def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET'
    headers['Access-Control-Max-Age'] = "1728000"
  end

end
