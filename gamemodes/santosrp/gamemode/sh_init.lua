
-----------------------------------------------------
--[[
	Name: sh_init.lua
	For: SantosRP
	By: Ultra
]]--

GM.Name 	= "SantosRP"
GM.Author 	= "Ultra"
GM.Email 	= "ultraminge@gmail.com"
GM.Website 	= ""

function GM:PrintDebug( intLevel, ... )
	--print( ... )
end

include( SERVER and "sv_manifest.lua" or "cl_manifest.lua" )

if not debug.getregistry().Player.CheckGroup then
	debug.getregistry().Player.CheckGroup = function()
		return true
	end
end

if game.SinglePlayer() then
	debug.getregistry().Player.SteamID64 = function()
		return "1234567890"
	end
end

--Precache models
for k, v in pairs( GM.Config.PlayerModels.Male ) do
	util.PrecacheModel( k )
end

for k, v in pairs( GM.Config.PlayerModels.Female ) do
	util.PrecacheModel( k )
end

for k, v in pairs( GM.Config.PlayerModelOverloads.Male or {} ) do
	util.PrecacheModel( k )
end

for k, v in pairs( GM.Config.PlayerModelOverloads.Female or {} ) do
	util.PrecacheModel( k )
end

--[[function GM:CalcMainActivity( ply, velocity )
	ply.CalcIdeal = ACT_MP_STAND_IDLE
	ply.CalcSeqOverride = -1

	self:HandlePlayerLanding( ply, velocity, ply.m_bWasOnGround )

	if self:HandlePlayerDriving( ply ) or
		self:HandlePlayerJumping( ply, velocity ) or
		self:HandlePlayerSwimming( ply, velocity ) or
		self:HandlePlayerDucking( ply, velocity ) then
	else
		local len2d = velocity:Length2D()
		if len2d > 150 then ply.CalcIdeal = ACT_MP_RUN elseif len2d > 0.5 then ply.CalcIdeal = ACT_MP_WALK end
	end

	ply.m_bWasOnGround = ply:IsOnGround()
	ply.m_bWasNoclipping = (ply:GetMoveType() == MOVETYPE_NOCLIP and not ply:InVehicle())
	return ply.CalcIdeal, ply.CalcSeqOverride
end]]--

--micro-optimized CalcMainActivity, TranslateActivity, UpdateAnimation
--also missing unused/not needed anims, gotta go fast
--using gotos like this plus all the locals and caching makes this run around 60% faster than the normal one
--sure is fucking ugly as hell though
do
	--functions
	local emeta = debug.getregistry().Entity
	local pmeta = debug.getregistry().Player
	local wmeta = debug.getregistry().Weapon
	local getMoveType = emeta.GetMoveType
	local isOnGround = emeta.IsOnGround
	local animRestartGesture = pmeta.AnimRestartGesture
	local animRestartMainSequence = pmeta.AnimRestartMainSequence
	local inVehicle = pmeta.InVehicle
	local getVehicle = pmeta.GetVehicle
	local lookupSequence = emeta.LookupSequence
	local getAllowWeaponsInVehicle = pmeta.GetAllowWeaponsInVehicle
	local getActiveWeapon = pmeta.GetActiveWeapon
	local crouching = pmeta.Crouching
	local getClass = emeta.GetClass
	local getModel = emeta.GetModel
	local getWaterLevel = emeta.WaterLevel
	local getTable = emeta.GetTable
	local getHoldType = wmeta.GetHoldType

	--CalcMainActivity
	local calcIdeal, calcSeqOverride
	local movType, onGround, wasOnGround

	--HandlePlayerDriving
	local inVeh, pVehicle, c, t, class, seq, use_anims, holdtype, seqid

	--HandlePlayerJumping
	local velLen

	local jmp, ptable
	function GM:CalcMainActivity( pPlayer, vecVel )
		jmp = nil
		calcIdeal = ACT_MP_STAND_IDLE
		calcSeqOverride = -1
		pTable = getTable( pPlayer )
		movType = getMoveType( pPlayer )
		onGround = isOnGround( pPlayer )
		wasOnGround = pTable.m_bWasOnGround
		velLen = vecVel:Length2DSqr()

		::unhandled::
		if jmp then
			if velLen > 22500 then calcIdeal = ACT_MP_RUN elseif velLen > 0.25 then calcIdeal = ACT_MP_WALK end
			goto handled
		end
		
		::handled::
		if jmp then
			pTable.m_bWasOnGround = onGround
			pTable.m_bWasNoclipping = (movType == MOVETYPE_NOCLIP and not inVeh)
			return calcIdeal, calcSeqOverride
		end

		jmp = true

		--Being HandlePlayerDucking
			::ducking::
			if not jmp then
				if not crouching( pPlayer ) then
					jmp = true; goto unhandled
				end

				if velLen > 0.25 then
					calcIdeal = ACT_MP_CROUCHWALK
				else
					calcIdeal = ACT_MP_CROUCH_IDLE
				end

				jmp = true; goto handled
			end
		--End HandlePlayerDucking

		--Begin HandlePlayerSwimming
			::swimming::
			if not jmp then
				if waterLevel < 2 or onGround then
					pTable.m_bInSwim = false
					goto ducking
				end

				calcIdeal = ACT_MP_SWIM
				pTable.m_bInSwim = true

				jmp = true; goto handled
			end
		--End HandlePlayerSwimming

		--Begin HandlePlayerJumping
			::jumping::
			if not jmp then
				waterLevel = getWaterLevel( pPlayer ) --Might need this later in HandlePlayerSwimming!

				if movType == MOVETYPE_NOCLIP then
					pTable.m_bJumping = false
					goto swimming
				end

				-- airwalk more like hl2mp, we airwalk until we have 0 velocity, then it's the jump animation
				-- underwater we're alright we airwalking
				if not pTable.m_bJumping and not onGround and waterLevel <= 0 then
					if not pTable.m_fGroundTime then
						pTable.m_fGroundTime = CurTime()
					elseif (CurTime() -pTable.m_fGroundTime) > 0 and velLen < 0.25 then
						pTable.m_bJumping = true
						pTable.m_bFirstJumpFrame = false
						pTable.m_flJumpStartTime = 0
					end
				end

				if pTable.m_bJumping then
					if pTable.m_bFirstJumpFrame then
						pTable.m_bFirstJumpFrame = false
						--pPlayer:AnimRestartMainSequence()
						animRestartMainSequence( pPlayer )
					end
					
					if waterLevel >= 2 or (CurTime() -pTable.m_flJumpStartTime) > 0.2 and onGround then
						pTable.m_bJumping = false
						pTable.m_fGroundTime = nil
						--pPlayer:AnimRestartMainSequence()
						animRestartMainSequence( pPlayer )
					end
					
					if pTable.m_bJumping then
						calcIdeal = ACT_MP_JUMP
						jmp = true; goto handled
					end
				end

				goto swimming
			end
		--End HandlePlayerJumping

		--Begin HandlePlayerDriving
			::driving::
			if not jmp then
				inVeh = inVehicle( pPlayer )
				if not inVeh then
					goto jumping
				end
				pVehicle = getVehicle( pPlayer )

				if not pVehicle.HandleAnimation and pVehicle.GetVehicleClass then
					c = pVehicle:GetVehicleClass()
					t = list.Get( "Vehicles" )[c]
					if t and t.Members and t.Memebers.HandleAnimation then
						pVehicle.HandleAnimation = t.Members.HandleAnimation
					else
						pVehicle.HandleAnimation = true --Prevent this if block from trying to assign HandleAnimation again.
					end
				end

				class = getClass( pVehicle )
				if isfunction( pVehicle.HandleAnimation ) then
					seq = pVehicle:HandleAnimation( pPlayer )
					if seq ~= nil then
						calcSeqOverride = seq
					end
				end

				if calcSeqOverride == -1 then --pVehicle.HandleAnimation did not give us an animation
					if class == "prop_vehicle_jeep" then
						calcSeqOverride = lookupSequence( pPlayer, "drive_jeep" )
					elseif class == "prop_vehicle_airboat" then
						calcSeqOverride = lookupSequence( pPlayer, "drive_airboat" )
					elseif class == "prop_vehicle_prisoner_pod" and getModel( pVehicle ) == "models/vehicles/prisoner_pod_inner.mdl" then
						-- HACK!!
						calcSeqOverride = lookupSequence( pPlayer, "drive_pd" )
					else
						calcSeqOverride = lookupSequence( pPlayer, "sit_rollercoaster" )
					end
				end
				
				use_anims = calcSeqOverride == lookupSequence( pPlayer, "sit_rollercoaster" ) or
					calcSeqOverride == lookupSequence( pPlayer, "sit" )

				if use_anims and getAllowWeaponsInVehicle( pPlayer ) and IsValid( getActiveWeapon(pPlayer) ) then
					holdtype = getHoldType( getActiveWeapon(pPlayer) )
					if holdtype == "smg" then holdtype = "smg1" end

					seqid = lookupSequence( pPlayer, "sit_".. holdtype )
					if seqid ~= -1 then
						calcSeqOverride = seqid
					end
				end

				jmp = true; goto handled
			end
		--End HandlePlayerDriving

		jmp = nil
		--Begin HandlePlayerLanding
			::landing::
			if not jmp then
				if movType ~= MOVETYPE_NOCLIP then
					if onGround and not wasOnGround then
						animRestartGesture( pPlayer, GESTURE_SLOT_JUMP, ACT_LAND, true )
					end
				end

				goto driving
			end
		--End HandlePlayerLanding
	end


	local IdleActivity = ACT_HL2MP_IDLE
	local IdleActivityTranslate = {}
	IdleActivityTranslate[ACT_MP_STAND_IDLE]				= IdleActivity
	IdleActivityTranslate[ACT_MP_WALK]						= IdleActivity +1
	IdleActivityTranslate[ACT_MP_RUN]						= IdleActivity +2
	IdleActivityTranslate[ACT_MP_CROUCH_IDLE]				= IdleActivity +3
	IdleActivityTranslate[ACT_MP_CROUCHWALK]				= IdleActivity +4
	IdleActivityTranslate[ACT_MP_ATTACK_STAND_PRIMARYFIRE]	= IdleActivity +5
	IdleActivityTranslate[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]	= IdleActivity +5
	IdleActivityTranslate[ACT_MP_RELOAD_STAND]				= IdleActivity +6
	IdleActivityTranslate[ACT_MP_RELOAD_CROUCH]				= IdleActivity +6
	IdleActivityTranslate[ACT_MP_JUMP]						= ACT_HL2MP_JUMP_SLAM
	IdleActivityTranslate[ACT_MP_SWIM]						= IdleActivity +9
	IdleActivityTranslate[ACT_LAND]							= ACT_LAND
	local translateWeaponActivity = debug.getregistry().Player.TranslateWeaponActivity
	function GM:TranslateActivity( ply, act )
		local newact = translateWeaponActivity( ply, act ) --ply:TranslateWeaponActivity( act )
		-- select idle anims if the weapon didn't decide
		if act == newact then
			return IdleActivityTranslate[act]
		end
		return newact
	end
end

do
	local emeta = debug.getregistry().Entity
	local pmeta = debug.getregistry().Player
	local isOnGround = emeta.IsOnGround
	local getWaterLevel = emeta.WaterLevel
	local setPlaybackRate = emeta.SetPlaybackRate
	local setPoseParameter = emeta.SetPoseParameter
	local getPoseParameter = emeta.GetPoseParameter
	local getVelocity = emeta.GetVelocity
	local getUp = emeta.GetUp
	local inVehicle = pmeta.InVehicle
	local getVehicle = pmeta.GetVehicle
	local getClass = emeta.GetClass
	local upVec = Vector( 0, 0, 1 )

	local len, movement, rate
	local Vehicle, Velocity, fwd, dp, dp2, steer
	function GM:UpdateAnimation( ply, velocity, maxseqgroundspeed )
		len = velocity:Length()
		movement = 1.0

		if len > 0.2 then
			movement = len /maxseqgroundspeed
		end

		rate = math.min( movement, 2 )
		-- if we're under water we want to constantly be swimming..
		if getWaterLevel( ply ) >= 2 then
			rate = math.max( rate, 0.5 )
		elseif not isOnGround( ply ) and len >= 1000 then
			rate = 0.1
		end

		setPlaybackRate( ply, rate )

		if CLIENT then
			if inVehicle( ply ) then
				Vehicle = getVehicle( ply )
				
				-- We only need to do this clientside..
				--
				-- This is used for the 'rollercoaster' arms
				--
				Velocity = getVelocity( Vehicle )
				fwd = getUp( Vehicle )
				dp = fwd:Dot( upVec )
				dp2 = fwd:Dot( Velocity )
				setPoseParameter( ply, "vertical_velocity", ( dp < 0 and dp or 0 ) + dp2 * 0.005 )

				-- Pass the vehicles steer param down to the player
				steer = getPoseParameter( Vehicle, "vehicle_steer" )
				steer = steer *2 -1 -- convert from 0..1 to -1..1
				if getClass( Vehicle ) == "prop_vehicle_prisoner_pod" then
					steer = 0
					setPoseParameter( ply, "aim_yaw", math.NormalizeAngle(
						ply:GetAimVector():Angle().y -Vehicle:GetAngles().y -90
					) )
				end
				setPoseParameter( ply, "vehicle_steer", steer )
			end

			GAMEMODE:GrabEarAnimation( ply )
			GAMEMODE:MouthMoveAnimation( ply )
		end
	end
end