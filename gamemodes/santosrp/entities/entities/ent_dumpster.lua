
-----------------------------------------------------
--[[
	Name: ent_dumpster.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then AddCSLuaFile() end

ENT.Base 				= "base_anim"
ENT.PrintName			= ""
ENT.Author				= ""
ENT.Contact				= ""
ENT.Purpose				= ""
ENT.Instructions		= ""
ENT.MaxGarbageAmount 	= 5000
ENT.PlayerVolume 		= 850
ENT.RemoverBounds		= {
	Min = Vector( -47.424805, -23.573730, 8.710327 ),
	Max = Vector( 47.214600, 23.261230, 57.320923 )
}
ENT.FxPos = Vector( -1.938616, 6.586751, 8.710327 )
ENT.FxSounds = {
	"ambient/materials/cupdrop.wav",
	"ambient/materials/platedrop3.wav",
	"ambient/materials/platedrop2.wav",
	"ambient/materials/platedrop1.wav",
	"ambient/materials/cartrap_rope3.wav",
	"ambient/materials/cartrap_rope2.wav",
	"ambient/materials/cartrap_rope1.wav",
	"ambient/materials/rock1.wav",
	"ambient/materials/rock2.wav",
	"ambient/materials/rock3.wav",
	"physics/glass/glass_bottle_break1.wav",
	"physics/glass/glass_bottle_break2.wav",
	"physics/wood/wood_box_break1.wav",
	"physics/wood/wood_box_break2.wav",
	"physics/plastic/plastic_barrel_break2.wav",
	"physics/plastic/plastic_barrel_break1.wav",
	"physics/cardboard/cardboard_box_break1.wav",
	"physics/cardboard/cardboard_box_break2.wav",
}

ENT.RandFillMin = 125
ENT.RandFillMax = 800
ENT.RandFillMinTime = 60 *2
ENT.RandFillMaxTime = 60 *3

function ENT:Initialize()
	self.BlockDrag = true
	
	if SERVER then
		self:SetModel( "models/sligwolf/garbagetruck/sw_dumpster.mdl" )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )
		self:SetTrigger( true )
		self.BlockPhysGun = true

		self.m_intMaxRange = 768
		self.m_vecHome = Vector( 0, 0, 0 )
		self.m_angHome = Angle( 0, 0, 0 )
		self.m_intGarbage = math.random( 0, self.MaxGarbageAmount )

		local phys = self:GetPhysicsObject()
		if IsValid( phys ) then
			phys:EnableMotion( false )
		end
	end
end

if SERVER then
	function ENT:Setup( vecHomePos, angHomeAngs, intMaxRange )
		self.m_vecHome = vecHomePos
		self.m_angHome = angHomeAngs
		self.m_intMaxRange = intMaxRange

		self:SetPos( self.m_vecHome )
		self:SetAngles( self.m_angHome )
	end

	function ENT:OnRemove()
		if IsValid( self.m_entTruck ) then
			self.m_entTruck:RemoveCallOnRemove( "DumpsterReset" )
		end
	end

	function ENT:AddGarbage( intAmount )
		self.m_intGarbage = math.min( self.m_intGarbage +intAmount, self.MaxGarbageAmount )
	end

	function ENT:ThrowAway( eEnt )
		if eEnt.ThrownAway then return false end

		if eEnt:IsRagdoll() then --Throwing away an uncon player?
			if not eEnt.IsUncon then return false end --Only if they are dead!
			if not IsValid( eEnt.RagdollPlayer ) then return false end --Only valid players!

			local pl = eEnt.RagdollPlayer
			GAMEMODE.Util:PlayerEmitSound( pl, "Death" )
			eEnt.ThrownAway = true
			pl:UnRagdoll( true, true ) --NoSpawn, NoHealth
			pl:Spectate( OBS_MODE_CHASE )
			pl:SpectateEntity( self ) --Spectate us instead!
			pl:SetNWFloat( "StartDie", CurTime() -(9 *60) )
		elseif eEnt.IsItem then --Throwing away a dropped item
			local itemData = GAMEMODE.Inv:GetItem( eEnt.ItemID or "" )
			if not itemData then return false end
			
			self:AddGarbage( itemData.Volume or 50 )
			eEnt.ItemTakeBlocked = true
			eEnt.ThrownAway = true
			GAMEMODE.Entity:Dissolve( eEnt )
		end

		return true
	end

	function ENT:AttachToGarbageTruck( entVeh )
		if self:IsAttachedToTruck() then return false end
		if self.m_intAttachTime and self.m_intAttachTime > CurTime() then return false end
		if not entVeh.SWGbTruckForkOpenClose or entVeh.SWGbTruckForkOpenClose == 1 then return false end
		if not self:GetAttachment( 1 ) or not entVeh:GetAttachment( 1 ) then return false end
		if self:GetAttachment( 1 ).Pos:Distance( entVeh:GetAttachment(1).Pos ) > 20 then return false end

		entVeh:EmitSound( "weapons/crowbar/crowbar_impact1.wav", 80, 40 )

		local phys = self:GetPhysicsObject()
		if IsValid( phys ) then
			phys:EnableMotion( true )
			phys:Wake()
		end

		for k, v in pairs( entVeh.GarbagetruckFork ) do
			constraint.RemoveConstraints( v, "Weld" )
			timer.Simple( 0, function()
				if not IsValid( entVeh ) then return end
				if not IsValid( self ) then return end

				local sequence = self:LookupSequence( "close" )
				if sequence then
					self:ResetSequence( sequence )
				end
				
				local weld = constraint.Weld( self, v, 0, 0, 0, 0, false )
			end )
		end
		
		--If the truck is removed for any reason while carrying us, catch that so we can handle it
		self.m_entTruck = entVeh
		self.m_entTruck:CallOnRemove( "DumpsterReset", function( eEnt )
			if not IsValid( self ) then return end

			local phys = self:GetPhysicsObject()
			if IsValid( phys ) then
				phys:EnableMotion( false )
			end

			local sequence = self:LookupSequence( "open" )
			if sequence then
				self:ResetSequence( sequence )
			end	

			timer.Simple( 1, function()
				if not IsValid( self ) then return end
				self:SetPos( self.m_vecHome )
				self:SetAngles( self.m_angHome )
			end )

			self.m_entTruck = nil
			self.m_bNoCollision = true
			self:SetCollisionGroup( COLLISION_GROUP_WORLD )
			if IsValid( phys ) then phys:RecheckCollisionFilter() end
			self.m_intAttachTime = CurTime() +2
		end )

		entVeh.m_entAttachedDumpster = self
		entVeh.SWGbTruckDumpsterWeldUnweld = 1
		self.m_intAttachTime = CurTime() +1
		return true
	end
	
	function ENT:RemoveFromGarbageTruck( bUser )
		if not self:IsAttachedToTruck() then return false end
		if self.m_intAttachTime and self.m_intAttachTime > CurTime() then return false end
		if bUser and self:GetAngles().r >= 2 then return false end
		self.m_entTruck:EmitSound( "weapons/crowbar/crowbar_impact1.wav", 80, 60 )
		constraint.RemoveConstraints( self, "Weld" )

		local phys = self:GetPhysicsObject()
		if IsValid( phys ) then
			phys:EnableMotion( false )
		end

		local truck = self.m_entTruck
		for k, v in pairs( self.m_entTruck.GarbagetruckFork ) do
			constraint.RemoveConstraints( v, "Weld" )
			timer.Simple( 0, function()
				if not IsValid( truck ) then return end
				if not IsValid( self ) then return end
				
				local sequence = self:LookupSequence( "open" )
				if sequence then
					self:ResetSequence( sequence )
				end
				
				v:SetPos( truck:GetPos() +(truck:GetAngles():Forward() *0) -(truck:GetAngles():Right() *65) +(truck:GetAngles():Up() *60) )
				v:SetAngles( truck:GetAngles() )

				local weld = constraint.Weld( v, truck, 0, 0, 0, 0, true )

				timer.Simple( 1, function()
					if not IsValid( self ) then return end
					self:SetPos( self.m_vecHome )
					self:SetAngles( self.m_angHome )
				end )
			end )
		end

		self.m_entTruck:RemoveCallOnRemove( "DumpsterReset" )
		self.m_entTruck.m_entAttachedDumpster = nil
		self.m_entTruck.SWGbTruckDumpsterWeldUnweld = 0
		self.m_entTruck = nil

		self.m_bNoCollision = true
		self:SetCollisionGroup( COLLISION_GROUP_WORLD )
		local phys = self:GetPhysicsObject()
		if IsValid( phys ) then phys:RecheckCollisionFilter() end

		self.m_intAttachTime = CurTime() +2
		return true
	end
	
	function ENT:IsAttachedToTruck()
		return IsValid( self.m_entTruck )
	end

	function ENT:Use( pPlayer )
		if not self.m_bOpen then
			if self:GetPos():Distance( pPlayer:GetPos() ) <= 70 then
				local sequence = self:LookupSequence( "close" )
				self:ResetSequence( sequence )
				self.m_bOpen = true	
				self:EmitSound( "vehicles/sligwolf/truck/sw_truck_mechanic.wav", 80, 100 ) 
			end
		elseif self.m_bOpen then
			if self:GetPos():Distance( pPlayer:GetPos() ) <= 70 then
				local sequence = self:LookupSequence( "open" )
				self:ResetSequence( sequence )
				self.m_bOpen = nil
				self:EmitSound( "vehicles/sligwolf/truck/sw_truck_mechanic.wav", 80, 100 )
			end
		end
	end

	function ENT:Think()
		if not self.m_vecHome or not self.m_intMaxRange or not self.m_angHome then return end
		if self:IsAttachedToTruck() then
			self.m_intLastRandFillTime = nil
			if self:GetPos():Distance( self.m_vecHome ) > self.m_intMaxRange then
				self:RemoveFromGarbageTruck()
			else
				if self:GetAngles().r >= 89 and self.m_intGarbage > 0 then --assume over the truck
					if (self.m_intLastFx or 0) < CurTime() and self.m_entTruck:GetGarbage() < GAMEMODE.Jobs:GetJobByID( JOB_GARBWORKER ).TruckVolume then --check for volume > 0
						self.m_intLastFx = CurTime() +0.33
						local snd, _ = table.Random( self.FxSounds )
						self:EmitSound( snd, 80, math.random(80, 110), math.Rand(0.66, 0.85) )

						local effectData = EffectData()
						effectData:SetOrigin( self:LocalToWorld(self.FxPos) )
						effectData:SetNormal( self:GetAngles():Up() *0.75 )
						util.Effect( "trashFx", effectData )

						local num = 200
						local take = self.m_intGarbage >= num and num or self.m_intGarbage
						self.m_intGarbage = self.m_intGarbage -take
						self.m_entTruck:AddGarbage( take )
					end
				end
			end
			
			return
		end

		if (self.m_intLastTime or 0) > CurTime() then return end
		self.m_intLastTime = CurTime() +1

		if self.m_bNoCollision and CurTime() > (self.m_intAttachTime or 0) then
			local clear = true
			for k, v in pairs( ents.FindInSphere(self:GetPos(), 20) ) do
				if not IsValid( v ) or v == self then continue end
				if v:IsPlayer() or v:IsVehicle() then
					clear = false
					break
				end
			end

			if clear then
				self.m_bNoCollision = false
				self:SetCollisionGroup( COLLISION_GROUP_NONE )
				local phys = self:GetPhysicsObject()
				if IsValid( phys ) then phys:RecheckCollisionFilter() end
			end
		end

		for k, v in pairs( ents.FindInBox(self:LocalToWorld(self.RemoverBounds.Min), self:LocalToWorld(self.RemoverBounds.Max)) ) do
			if v == self then continue end 
			if v:IsPlayer() then continue end
			self:ThrowAway( v )
		end

		if (self.m_intLastRandFillTime or 0) < CurTime() then
			if not self.m_intLastRandFillTime or GAMEMODE.Jobs:GetNumPlayers( JOB_GARBWORKER ) <= 0 then
				self.m_intLastRandFillTime = CurTime() +math.random( self.RandFillMinTime, self.RandFillMaxTime )
				return
			end
			
			self.m_intLastRandFillTime = CurTime() +math.random( self.RandFillMinTime, self.RandFillMaxTime )
			self.m_intGarbage = math.Clamp( self.m_intGarbage +math.random(self.RandFillMin, self.RandFillMax), 0, self.MaxGarbageAmount )
		end
	end

	function ENT:StartTouch( entOther )
		if (self.m_intAttachTime or 0) > CurTime() and not IsValid( self.m_entTruck ) then --We were just dropped inside of this!
			self.m_bNoCollision = true
			self:SetCollisionGroup( COLLISION_GROUP_WORLD )
			local phys = self:GetPhysicsObject()
			if IsValid( phys ) then phys:RecheckCollisionFilter() end
		end
	end
end