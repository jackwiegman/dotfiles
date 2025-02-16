-- WirePlumber Policy for sink 37: upmix to 7.1 surround
context.init = function()
	-- Get the node (sink) by ID
	local sink = context:find_node("34")

	if sink then
		-- Set the properties to enable 7.1 upmixing
		sink.properties["audio.channels"] = 8 -- 7.1 surround (8 channels)
		sink.properties["audio.upmix"] = true -- Enable upmixing
		sink.properties["audio.upmix.mode"] = "stereo-to-7.1" -- Upmix stereo to 7.1
		sink.properties["audio.sample-rate"] = 48000 -- Sample rate (48kHz is standard for surround)
		sink.properties["audio.format"] = "S32LE" -- Audio format (32-bit little-endian)
	end
end
