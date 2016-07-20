
-----------------------------------------------------
local Dir, Dir2, dot, sp, ent, trace, seed, hm
local trace_normal = bit.bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)
local trace_walls = bit.bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)
local NoPenetration = {[MAT_SLOSH] = true}
local NoRicochet = {[MAT_FLESH] = true, [MAT_ANTLION] = true, [MAT_BLOODYFLESH] = true, [MAT_DIRT] = true, [MAT_SAND] = true, [MAT_GLASS] = true, [MAT_ALIENFLESH] = true}
local PenMod = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}
local bul, tr = {}, {}
local SP = game.SinglePlayer()

local reg = debug.getregistry()
local GetShootPos = reg.Player.GetShootPos
local GetCurrentCommand = reg.Player.GetCurrentCommand
local CommandNumber = reg.CUserCmd.CommandNumber

function SWEP:FireBullet()
	if CLIENT then
		hm = GetConVarNumber("fas2_hitmarker")
	else
		if SP then
			hm = tonumber(self.Owner:GetInfo("fas2_hitmarker"))
		end
	end
	
	sp = GetShootPos(self.Owner)
	math.randomseed(CurTime())
	
	Dir = (self.Owner:EyeAngles() + self.Owner:GetPunchAngle() + Angle(math.Rand(-self.CurCone, self.CurCone), math.Rand(-self.CurCone, self.CurCone), 0) * 25):Forward()
	
	for i = 1, self.Shots do
		Dir2 = Dir
		
		if self.ClumpSpread and self.ClumpSpread > 0 then
			Dir2 = Dir + Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * self.ClumpSpread
			
			--Dir2 = Dir + VectorRand() * self.ClumpSpread
		end
		
		bul.Num = 1
		bul.Src = sp
		bul.Dir = Dir2
		bul.Spread 	= Vector(0, 0, 0)
		bul.Tracer	= 4
		bul.Force	= self.Damage * 0.1
		bul.Damage = math.Round(self.Damage)
		bul.Callback = function(a, b, c)
			if SERVER and SP and hm > 0 then
				ent = b.Entity
				
				if ent:IsNPC() or ent:IsPlayer() then
					SendUserMessage("FAS2_HITMARKER", self.Owner)
				end
			end
			
			if CLIENT and hm > 0 then
				ent = b.Entity
				
				if ent:IsNPC() or ent:IsPlayer() then
					self.HitMarkerTime = CurTime() + 0.2
					self.HitMarkerAlpha = 255
				end
			end
		end
		
		self.Owner:FireBullets(bul)
		
		tr.start = sp
		tr.endpos = tr.start + Dir2 * 16384
		tr.filter = self.Owner
		tr.mask = trace_normal
		
		trace = util.TraceLine(tr)
			
		if not NoPenetration[trace.MatType] then
			dot = -Dir2:DotProduct(trace.HitNormal)
			ent = trace.Entity
		
			if self.PenetrationEnabled and dot > 0.26 and not ent:IsNPC() and not ent:IsPlayer() then
				tr.start = trace.HitPos
				tr.endpos = tr.start + Dir2 * self.PenStr * (PenMod[trace.MatType] and PenMod[trace.MatType] or 1) * self.PenMod
				tr.filter = self.Owner
				tr.mask = trace_walls
				
				trace = util.TraceLine(tr)
				
				tr.start = trace.HitPos
				tr.endpos = tr.start + Dir2 * 0.1
				tr.filter = self.Owner
				tr.mask = trace_normal
				
				trace = util.TraceLine(tr) -- run ANOTHER trace to check whether we've penetrated a surface or not
				
				if not trace.Hit then
					bul.Num = 1
					bul.Src = trace.HitPos
					bul.Dir = Dir2
					bul.Spread 	= Vec0
					bul.Tracer	= 4
					bul.Force	= self.Damage * 0.05
					bul.Damage = bul.Damage * 0.5
				
					bul.Callback = function(a, b, c)
						if SERVER and SP and hm > 0 then
							ent = b.Entity
							
							if ent:IsNPC() or ent:IsPlayer() then
								SendUserMessage("FAS2_HITMARKER", self.Owner)
							end
						end
			
						if CLIENT and hm > 0 then
							ent = b.Entity
							
							if ent:IsNPC() or ent:IsPlayer() then
								self.HitMarkerTime = CurTime() + 0.2
								self.HitMarkerAlpha = 255
							end
						end
					end
					
					self.Owner:FireBullets(bul)
					
					bul.Num = 1
					bul.Src = trace.HitPos
					bul.Dir = -Dir2
					bul.Spread 	= Vec0
					bul.Tracer	= 4
					bul.Force	= self.Damage * 0.05
					bul.Damage = bul.Damage * 0.5
					
					bul.Callback = function(a, b, c)
						if SERVER and SP and hm > 0 then
							ent = b.Entity
							
							if ent:IsNPC() or ent:IsPlayer() then
								SendUserMessage("FAS2_HITMARKER", self.Owner)
							end
						end

						if CLIENT and hm > 0 then
							ent = b.Entity
							
							if ent:IsNPC() or ent:IsPlayer() then
								self.HitMarkerTime = CurTime() + 0.2
								self.HitMarkerAlpha = 255
							end
						end
					end
					
					self.Owner:FireBullets(bul)
				end
			else
				if self.RicochetEnabled then
					if not NoRicochet[trace.MatType] then
						Dir2 = Dir2 + (trace.HitNormal * dot) * 3
						Dir2 = Dir2 + VectorRand() * 0.06
						bul.Num = 1
						bul.Src = trace.HitPos
						bul.Dir = Dir2
						bul.Spread 	= Vec0
						bul.Tracer	= 0
						bul.Force	= self.Damage * 0.075
						bul.Damage = bul.Damage * 0.75
						
						bul.Callback = function(a, b, c)
							if SERVER and SP then
								ent = b.Entity
								
								if ent:IsNPC() or ent:IsPlayer() then
									SendUserMessage("FAS2_HITMARKER", self.Owner)
								end
							end
						
							if CLIENT and hm > 0 then
								ent = b.Entity
								
								if ent:IsNPC() or ent:IsPlayer() then
									self.HitMarkerTime = CurTime() + 0.2
									self.HitMarkerAlpha = 255
								end
							end
						end
						
						self.Owner:FireBullets(bul)
					end
				end
			end
		end
	end
		
	tr.mask = trace_normal
end