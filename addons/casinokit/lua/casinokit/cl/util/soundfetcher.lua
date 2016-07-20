
-----------------------------------------------------
local folder = "casinokit/res"

local loaded = {}
local loading = {}
local function LoadUrl(url, cb)
	if loaded[url] then
		if cb then cb(loaded[url]) end
		return
	end

	local fileName = string.format("%08x", util.CRC(url)) .. ".txt"
	local path = folder .. "/" .. fileName
	file.CreateDir(folder)

	if file.Exists(path, "DATA") then
		loaded[url] = fileName
		if cb then cb(loaded[url]) end
		return
	end

	if loading[url] then
		return
	end

	loading[url] = true
	http.Fetch(url, function(data)
		file.Write(path, data)
		loaded[url] = fileName
		if cb then cb(loaded[url]) end
	end)
end

-- Materials fetched during lua init don't load properly

CasinoKit.playRemoteSound = function(url, opts, cb)
	LoadUrl(url, function(filename)
		sound.PlayFile("../data/casinokit/res/" .. filename, opts, cb)
	end)
end
