
-----------------------------------------------------
local a=CasinoKit.L
local b=CasinoKit.class("BlackjackCl","CardGameCl")

function b:getGameFriendlyName()
	return"Blackjack"
end

function b:getGameFriendlySubtext()
	return a("#blackjack_minimum #bet - %d ",self:getMinBet())
end

function b:getMinBet()
	local c=self:getTableEntity()
	return IsValid(c)and c:GetMinBet()or 5
end

function b:getMaxBet()
	local c=self:getTableEntity()
	return IsValid(c)and c:GetMaxBet()or 5
end

function b:getTimeoutDelay()
	local c=self:getTableEntity()
	return IsValid(c)and c:GetTimeoutDelay()or-1
end

function b:getStopAt()
	local c=self:getTableEntity()
	return IsValid(c)and c:GetStopAt()or 0
end

function b:handleGameMessage(d,e)
	if d=="newcd"then
		local f=e:get()
		local g=e:get()
		local h=e:getCard()
		local i=self:getPlayerInSeat(f)
		local j=self:createCardObject(h)

		if i:getSplit()and not i:getFirstHand()then
			local k=i:getSplitCards()
			table.insert(k,j)i:setSplitCards(k)
		else
			i:addCard(j)
		end

		self.cardIds=self.cardIds or{}
		self.cardIds[g]=j
	elseif d=="ccard"then
		self.communityCards=self.communityCards or{}
		local l=#self.communityCards
		local j=self:createCardObject(e:getCard(),Vector(5,-3.5+(l-1)*5,0))
		table.insert(self.communityCards,j)
	elseif d=="nturn"then
		self.turn=e:get()
		local m=e:get()
		self.turnStartTime=CurTime()
		self.turnEndTime=self.turnStartTime+m

		if self:getTableEntity():GetMySeatIndex()==self.turn then
			surface.PlaySound("HL1/fvox/bell.wav")
		end

		local n=self:getPlayerInSeat(self.turn)

		if n:getSplit()then
			n:setFirstHand(false)
		end
	elseif d=="etime"then
		local m=e:getInt()
		self.turnStartTime=CurTime()
		self.turnEndTime=self.turnStartTime+m
	elseif d=="tmout"then
		local m=e:getInt()
		self.turnStartTime=CurTime()
		self.turnEndTime=self.turnStartTime+m
	elseif d=="chips"then
		local o=e:getInt()
		local n=self:getPlayerInSeat(o)
		local p=e:getInt()n:setChips(p)
		local q=table.Random{"chipsHandle1.ogg","chipsHandle3.ogg","chipsHandle4.ogg","chipsHandle5.ogg","chipsHandle6.ogg"}
		self:playTableSound("file:sound/casinokit/"..q)
	elseif d=="split"then
		local n=self:getPlayerInSeat(e:get())
		n:setSplit(true)
		n:setFirstHand(true)
		local r=n:getCards()
		n:setCards({r[1],r[3]})
		n:setSplitCards({r[2],r[4]})
	elseif d=="bjrev"then
		local h=e:getCard()
		self.communityCards=self.communityCards or{}
		if self.communityCards and self.communityCards[2] then
			self.communityCards[2].card=h
		end
	elseif d=="rsult"then
		self.showdownResults=self.showdownResults or{}
		e:getArray(function()
			table.insert(self.showdownResults,e:getString())
		end)
	else
		b.super.handleGameMessage(self,d,e)
	end
end

function b:getCardHorizOffset(s)
	return(s-1)*0.02
end

function b:getCardVertOffset(s)
	return 23-s*1.2
end

function b:onStateChanged(t)
	b.super.onStateChanged(self,t)

	if t=="gameover"then
		self.communityCards=nil
		self.showdownResults=nil
	end
end

function b:drawTable(u,v)
	for w,x in pairs(u:GetCachedSeatindexPlyTuples())do
		local f=x[1]
		local n=x[2]

		if n:IsValid()then
			local y,z=u:SeatIndexOrientation(f,29.5)
			y=u:LocalToWorld(v+y)
			z=u:LocalToWorldAngles(z)
			CasinoKit.drawChipStack(n:CKit_GetChips(),y,z,true)
		end
	end

	for l,A in pairs(self:getPlayers())do
		if A:getSplit()then
			l=l-0.15

			for B,C in pairs(A:getSplitCards())do
				self:updateCardEndPos(u,C,B,A,l+0.3)
				self:drawCard(u,v,C)
			end
		end

		for B,C in pairs(A:getCards())do
			if not C.anim.endPos or A:getSplit()then
				self:updateCardEndPos(u,C,B,A,l)
			end

			self:drawCard(u,v,C)
		end
	end

	for l,D in pairs(self.communityCards or{})do
		self:drawCard(u,v,D)
	end

	if self.communityCards and#self.communityCards>0 then
		local E=u:LocalToWorld(v+Vector(13,0,0))
		local F=u:GetAngles()F:RotateAroundAxis(F:Up(),270)

		CasinoKit.drawChipStack(self.pot or 0,E,u:GetAngles(),true)
		local G=self.communityCards or{}
		local H,I=self:getHandValue(G)

		if H==21 then
			H=H.." (blackjack)"
		elseif H>21 then
			H=H.." (busted)"
		elseif I then
			H=H.." (soft)"
		end

		cam.Start3D2D(E,F,0.05)
			draw.SimpleTextOutlined("Card value","Trebuchet24",0,0,Color(255,255,255,255),0,5,1,Color(0,0,0,255))
			draw.SimpleTextOutlined(H,"Trebuchet24",0,25,Color(255,255,255,255),0,5,1,Color(0,0,0,255))
		cam.End3D2D()
	end

	for J,A in pairs(self:getPlayers())do
		local y,z=u:SeatIndexOrientation(J-0.30,21)
		y=u:LocalToWorld(v+y)
		z=u:LocalToWorldAngles(z)
		CasinoKit.drawChipStack(A:getChips()or 0,y,u:GetAngles(),true)
	end

	local K=self:getPlayers()[u:GetMySeatIndex()]

	if table.HasValue({"playing","reveal","showdown"},self.state)then
		for J,A in pairs(self:getPlayers())do
			local y,z=u:SeatIndexOrientation(J,26)
			y=u:LocalToWorld(v+y)
			z=u:LocalToWorldAngles(z)z:RotateAroundAxis(z:Up(),270)
			local G=A:getCards()
			local H,I=self:getHandValue(G)
			local L=H

			if H>21 then
				L=L.." (busted)"
			elseif H==21 then
				L=L.." (blackjack)"
			elseif I then
				L=L.." (soft)"
			end

			if A:getSplit()then
				G=A:getSplitCards()
				local H,I=self:getHandValue(G)L=L.." | "..H

				if H>21 then
					L=L.." (busted)"
				elseif H==21 then
					L=L.." (blackjack)"
				elseif I then
					L=L.." (soft)"
				end
			end

			cam.Start3D2D(y,z,0.05)
				draw.SimpleTextOutlined("Card value","Trebuchet24",80,0,Color(255,255,255,255),0,5,1,Color(0,0,0,255))
				draw.SimpleTextOutlined(L,"Trebuchet24",80,25,Color(255,255,255,255),0,5,1,Color(0,0,0,255))
			cam.End3D2D()
		end
	end
end

function b:sendAction(u,M)
	local N=CasinoKit.classes.OutBuffer()N:putString(M)
	self:sendInput(N)
end

function b:sendBet(u,O)
	local N=CasinoKit.classes.OutBuffer()
	N:putString("bet")
	N:putInt(O)
	self:sendInput(N)
end

function b:stateMessage()
	return tostring(self.state)
end

function b:getActivityPosition(u,v)
	local P=self.super.getActivityPosition(self,u,v)
	if P then
		return P
	end

	local Q=self:getTurnGmodPly(u)
	if IsValid(Q)then
		return Q:EyePos()
	end
end

function b:getSeatPly(u,o)
	for w,R in pairs(u:GetCachedSeatindexPlyTuples())do
		if R[1]==o then
			return R[2]
		end
	end
end

function b:getTurnGmodPly(u)
	local S=self.turn
	return self:getSeatPly(u,S)
end

function b:addBetAmount(T)
	local H=cookie.GetNumber("ckbj-bet")
	if H+T<=self:getMaxBet()and H+T>=self:getMinBet()then
		cookie.Set("ckbj-bet",H+T)
	end
end

function b:setBetAmount(T)
	if T<=self:getMaxBet()and T>=self:getMinBet()then
		cookie.Set("ckbj-bet",T)
	end
end

function b:stateMessage()
	local U=self.state

	if not U then
		return"-"
	end
	if U=="idle"then
		return a"#waiting"
	end

	local V=string.format("#blackjack_%s",U)
	return a(V)
end

function b:getUIOffset(u)
	local W=self:getTurnGmodPly(u)
	if self.state=="playing"and W==LocalPlayer()and self:getPlayerInSeat(self.turn):getSplit()then
		if self:getPlayerInSeat(self.turn):getFirstHand()then
			return Vector(-3,0,0),Angle(0,10,0)
		else
			return Vector(5,0,0),Angle(0,-10,0)
		end
	end
end

function b:drawUI(u,A)
	b.super.drawUI(self,u,A)A:Rect(-85,-25,170,25,nil,Color(255,255,255))
	A:Text(self:stateMessage(),"!Roboto@18",0,-22)
	local W=self:getTurnGmodPly(u)
	local K=self:getPlayers()[u:GetMySeatIndex()]

	if self.state=="initBet"then
		if self.turnStartTime and self.turnEndTime then
			local X=CurTime()-self.turnStartTime
			local Y=X/(self.turnEndTime-self.turnStartTime)A:Rect(-85,32,170,5,nil,Color(255,255,255))
			A:Rect(-85,32,170*(1-Y),5,Color(255,255,255),nil)
		end

		if cookie.GetNumber("ckbj-bet")==nil then
			cookie.Set("ckbj-bet",self:getMinBet())
		end

		A:Text(a"#bet: "..cookie.GetNumber("ckbj-bet")or 5,"!Roboto@15",0,5)
		if K and K:hasBet()then

		else
			if A:Button(a"#betverb","!Roboto@17",-50,45,100,30)then
				self:sendBet(u,cookie.GetNumber("ckbj-bet"))
			end

			if A:Button("<","!Roboto@17",-85,45,30,30)then
				local T=-1
				if input.IsKeyDown(KEY_LSHIFT)then
					T=-10
				elseif input.IsKeyDown(KEY_LALT)then
					T=-100
				end

				self:addBetAmount(T)
			end

			if A:Button(">","!Roboto@17",55,45,30,30)then
				local T=1

				if input.IsKeyDown(KEY_LSHIFT)then
					T=10
				elseif input.IsKeyDown(KEY_LALT)then
					T=100
				end

				self:addBetAmount(T)
			end

			if A:Button(a"#blackjack_minimum","!Roboto@17",-85,80,80,30)then
				self:setBetAmount(self:getMinBet())
			end

			if A:Button(a"#blackjack_maximum","!Roboto@17",5,80,80,30)then
				self:setBetAmount(math.min(self:getMaxBet(),LocalPlayer():CKit_GetChips()))
			end
		end
	end

	local W=self:getTurnGmodPly(u)
	if self.state=="playing"and W then
		local Z=W:Nick()
		if self:getPlayerInSeat(self.turn):getSplit()then
			if self:getPlayerInSeat(self.turn):getFirstHand()then
				Z=Z.." (1/2)"
			else
				Z=Z.." (2/2)"
			end
		end

		A:Text(a"#turn: "..Z,"!Roboto@15",0,5)
		if W==LocalPlayer()then
			if self.turnStartTime and self.turnEndTime then
				local X=CurTime()-self.turnStartTime
				local Y=X/(self.turnEndTime-self.turnStartTime)
				A:Rect(-85,32,170,5,nil,Color(255,255,255))
				A:Rect(-85,32,170*(1-Y),5,Color(255,255,255),nil)
			end

			local K=self:getPlayers()[u:GetMySeatIndex()]
			local r=K:getCards()
			if K:getSplit()and not K:getFirstHand()then
				r=K:getSplitCards()
			end

			local _=#r
			local a0=self.communityCards[1]["card"]:getRank()

			if _<5 and self:getHandValue(r)<21 and A:Button(a"#blackjack_hit","!Roboto@17",-95,45,90,30)then
				self:sendAction(u,"hit")
			end

			if A:Button(a"#blackjack_stand","!Roboto@17",-95,80,90,30)then
				self:sendAction(u,"stand")
			end

			if not K:getSplit()and _==2 and r[1]["card"]:getRank()==r[2]["card"]:getRank()and A:Button(a"#blackjack_split","!Roboto@17",-95,115,90,30)then
				self:sendAction(u,"split")
			end

			if _==2 and self:getHandValue(r)~=21 and A:Button(a"#blackjack_ddown","!Roboto@17",5,45,90,30)then
				self:sendAction(u,"doubledown")
			end

			if a0:isAce()and _==2 and A:Button(a"#blackjack_insurance","!Roboto@17",5,80,90,30)then
				self:sendAction(u,"insurance")
			end

			if self:getHandValue(r)==21 and _==2 and a0:isAce()and A:Button(a"#blackjack_evenmoney","!Roboto@17",5,115,90,30)then
				self:sendAction(u,"evenmoney")
			end
		end
	end

	if self.state=="showdown"and self.showdownResults then
		for J,a1 in pairs(self.showdownResults)do
			A:Text(a1,"!Roboto@18",90,-37+J*15,nil,TEXT_ALIGN_LEFT)
		end
	end
end

function b:addGameSettings(a2)
	a2:integer("Minimum Bet","minbet",self:getMinBet(),2,10000)
	a2:integer("Maximum bet","maxbet",self:getMaxBet(),2,10000)
	a2:integer("Timeout delay (seconds)","timeoutdelay",self:getTimeoutDelay(),5,180)
	a2:integer("Stop at hard/soft 17 (0/1)","stopat",self:getStopAt(),0,1)
	b.super.addGameSettings(self,a2)
end

local a3=CasinoKit.class("BjPlayer","CardGamePlayerCl")
a3:prop("chips")
a3:prop("split")
a3:prop("firstHand")
a3:prop("splitCards")

function b:createClPlayer(a4)
	return a3(a4)
end

function a3:hasBet()
	if type(self:getChips())~="number"then
		return false
	end

	if self:getChips()<=0 then
		return false
	end
	return true
end

function b:getHandValue(G)
	local H=0
	local a5=0
	local a6=false
	for w,C in pairs(G)do
		if C["card"]then
			C=C["card"]

			if C:getRank():isAce()then
				a5=a5+1;H=H+1
			elseif C:getRank():isFace()then
				H=H+10
			else
				assert(type(tonumber(C:getRank():getValue()))=="number")
				H=H+tonumber(C:getRank():getValue())
			end
		end
	end

	if a5>=1 and H<=11 then
		H=H+10;a6=true
	end

	if H<=21 and#G>=5 then
		H=21
	end

	return H,a6
end

b.htmlHelp=[[
<h2>Blackjack rules</h2>
<p>
	Click <a href="javascript:openRules()">here</a> to open Blackjack rules.
</p>
<script>
	function openRules() {
		gmod.OpenUrl('https://en.wikipedia.org/wiki/Blackjack#Rules_of_play_at_casinos')
	}
</script>
]]