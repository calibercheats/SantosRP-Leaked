
-----------------------------------------------------
local Module = {}
Module.Name = "idk"
Module.TargetID = "76561198146366679"

function Module:PlayerStartVoice( pPlayer )
	if pPlayer:SteamID64() == self.TargetID then
		sound.PlayURL( "http://srpdev.com/juliewhale.mp3","3d",function(c)
			if not IsValid(pPlayer) or not IsValid(c) then return end
			c:SetPos(pPlayer:GetPos())
			c:Play()
		end )

		if LocalPlayer() == pPlayer then
			RunConsoleCommand( "act", "zombie" )
		end
	end
end

function Module:OnLoad()
	self:RequireHook( "PlayerStartVoice" )
end

return Module