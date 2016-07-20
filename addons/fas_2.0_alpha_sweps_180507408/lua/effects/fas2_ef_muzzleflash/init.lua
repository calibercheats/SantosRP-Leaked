
-----------------------------------------------------
local att, ent, ply, dlight, w, CT

function EFFECT:Init(ef)
	CT = CurTime()
	
	if IsValid(ef:GetEntity()) then
		ent = ef:GetEntity()
		ply = ent.Owner

		if ply:ShouldDrawLocalPlayer() then
			w = ent.W_Wep
			
			if w and IsValid( w ) then
				att = w:GetAttachment(w:LookupAttachment("muzzle"))
				
				if not att then
					ent:GetAttachment("1")
				end
				
				if att then
					if not ent.dt.Suppressed then
						ParticleEffect(ent.MuzzleEffect, att.Pos, att.Ang, att)
						
						dlight = DynamicLight(self:EntIndex())
						dlight.Pos = att.Pos
						dlight.r = 255
						dlight.g = 170
						dlight.b = 0
						dlight.Brightness = 1
						dlight.Size = 32
						dlight.Decay = 128
						dlight.DieTime = CT + 0.1
					else
						ParticleEffect("muzzleflash_suppressed", att.Pos, att.Ang, att)
					end
				end
			else
				ent:GetAttachment("1")
				
				if att then
					if not ent.dt.Suppressed then
						ParticleEffect(ent.MuzzleEffect, att.Pos, att.Ang, att)
						
						dlight = DynamicLight(self:EntIndex())
						dlight.Pos = att.Pos
						dlight.r = 255
						dlight.g = 170
						dlight.b = 0
						dlight.Brightness = 1
						dlight.Size = 32
						dlight.Decay = 128
						dlight.DieTime = CT + 0.1
					else
						ParticleEffect("muzzleflash_suppressed", att.Pos, att.Ang, att)
					end
				end
			end
		end
	end
	
	self.DieTime = CT + 0.01
end

function EFFECT:Think()
	if not IsValid(self.Emitter) then
		return false
	end
	
	if CurTime() > self.DieTime then
		self.Emitter:Finish()
		return false
	else
		return true
	end
end

function EFFECT:Render()
end