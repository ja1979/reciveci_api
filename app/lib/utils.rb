module Utils

	def serverUrl(request)
		request.protocol + request.host + ":" + request.port.to_s + "/"
	end

end