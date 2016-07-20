
-----------------------------------------------------
local dlqueue = {}

local loading = false
local function CheckWSQueue(delayTime)
	if loading then return end

	local o = dlqueue[1]
	if o then
		if o.fileid then
			MsgN("[CasinoKit-DL] Initiating download of fileid " .. o.fileid)
			o.loading = true
			loading = true
			steamworks.Download(o.fileid, true, function(name)
				o.loading = false
				loading = false

				MsgN("[CasinoKit-DL] Fileid " .. o.fileid .. " downloaded to " .. name .. ". Mounting.")
				game.MountGMA(name)

				if o.cb then o.cb() end

				table.remove(dlqueue, 1)
				CheckWSQueue()
			end)
		else
			timer.Simple(0.5, CheckWSQueue)
		end
	end
end

function CasinoKit.fetchFromWorkshop(id, cb)
	MsgN("[CasinoKit-DL] Queueing download of " .. id)

	local t = {id = id, cb = cb}
	table.insert(dlqueue, t)
	steamworks.FileInfo(id, function(result)
		t.name = result.title
		t.fileid = result.fileid
		t.size = result.size
	end)

	CheckWSQueue()
end

local loadingIcon = Material("icon16/monkey.png")
hook.Add("HUDPaint", "CasinoKit_WSDLProgress", function()
	for i,o in pairs(dlqueue) do
		local x, y, w, h = ScrW() - 200, 200 +(i-1)*28, 200, 28
		surface.SetDrawColor(50, 50, 50)
		surface.DrawRect(x, y, w, h)

		surface.SetDrawColor(127, 127, 127)
		surface.DrawOutlinedRect(x, y, w, h)

		draw.SimpleText(o.name or "unknown", "DermaDefaultBold", x + 28, y + 7)

		if o.loading then
			surface.SetDrawColor(255, 255, 255)
			surface.SetMaterial(loadingIcon)
			surface.DrawTexturedRectRotated(x + 13, y + 13, 16, 16, CurTime() * 180)
		end
	end
end)
