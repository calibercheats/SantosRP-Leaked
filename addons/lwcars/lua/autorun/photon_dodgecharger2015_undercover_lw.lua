
-----------------------------------------------------
AddCSLuaFile()

local name = "Dodge Charger 2015 Undercover"

local A = "AMBER"
local R = "RED"
local DR = "D_RED"
local B = "BLUE"
local W = "WHITE"
local CW = "C_WHITE"
local SW = "S_WHITE"
local G = "GREEN"

local EMV = {}

EMV.Siren = 2

EMV.Color = Color( 8, 11, 22 )

EMV.Skin = 0

EMV.BodyGroups = {
}

EMV.Props = {
}

local sirenboxheight = 32.4
local lightbarheight = 77.052
EMV.Positions = {
--Whelen Sirenbox Buttons
	{ Vector(-2.95, 13.9,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- stand by 1
	{ Vector(-2.05, 13.9,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- rad 2
	{ Vector(2.45, 11.4,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- highpri 3 
	{ Vector(3.35, 12.65,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- caution 4 
	{ Vector(2.45, 12.65,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- stop 5 
	
	{ Vector(-0.25, 12.65,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- left 6	
	{ Vector(0.65, 12.65,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- center 7 
	{ Vector(1.55, 12.65,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- right 8
	
	{ Vector(-0.25, 11.4,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- left	alley 9
	{ Vector(0.65, 11.4,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- takedown 10
	{ Vector(1.55, 11.4,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- right alley 11
	{ Vector(3.35, 11.4,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- cruise 12
	
	{ Vector(-2.5, 12.15,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- code1 13 
	{ Vector(-2, 12.15,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- code2 14
	{ Vector(-1.5, 12.15,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, -- code3 15
--Whelen Sirenbox Lightbar Markers
	{ Vector(-1.2, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --16
	{ Vector(-1.48, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --17
	{ Vector(-1.75, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --18
	{ Vector(-2.04, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --19	
	{ Vector(-2.33, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --20
	{ Vector(-2.61, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --21
	{ Vector(-2.9, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --22	
	{ Vector(-3.2, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --23
	
--Wig wags	
	{ Vector(-37.26, 108.101,35.95), Angle(0,0,0), "headlight" }, --24		
	{ Vector(37.26, 108.101,35.95), Angle(0,0,0), "headlight" }, --25
	
--Code 3 Wingman
	{ Vector(23.88, -84.2,57.27), Angle(0,17,0), "code3_wingman" }, --26
	{ Vector(16.077, -86.321,57.34), Angle(0,11.3,0), "code3_wingman" }, --27 	
	{ Vector(7.99, -87.38,57.34), Angle(0,3.3,0), "code3_wingman" }, --28
	
	{ Vector(-7.99, -87.38,57.34), Angle(0,-3.3,0), "code3_wingman" }, --29 	
	{ Vector(-16.077, -86.321,57.34), Angle(0,-11.3,0), "code3_wingman" }, --30 	
	{ Vector(-23.88, -84.2,57.27), Angle(0,-17,0), "code3_wingman" }, --31 	
	
--Tail lights
	--l
	{ Vector(-37.282, -114.517,45.0), Angle(0,-35.9,0), "code3_wingman" }, --32	
	{ Vector(-34.784, -116.361,45.0), Angle(0,-30.3,0), "invis" }, --33	light point fix
	{ Vector(-31.914, -117.614,45.0), Angle(0,-23.5,0), "code3_wingman" }, --34	
	{ Vector(-26.562, -119.535,45.1), Angle(0,-14.7,0), "tail_inner" }, --35	
	---r
	{ Vector(37.282, -114.517,45.0), Angle(0,35.9,0), "code3_wingman" }, --36	
	{ Vector(34.784, -116.361,45.0), Angle(0,30.3,0), "invis" }, -- 37 light point fix
	{ Vector(31.914, -117.614,45.0), Angle(0,23.5,0), "code3_wingman" }, -- 38
	{ Vector(26.562, -119.535,45.1), Angle(0,14.7,0), "tail_inner" }, --39
	
--headlights
	{ Vector(-37.26, 108.101,35.95), Angle(0,0,0), "headlight_l" }, --40		
	{ Vector(37.26, 108.101,35.95), Angle(0,0,0), "headlight_r" }, --41
	
--Window lights
	{ Vector(2.6, 51.875,53.17), Angle(0,180,0), "code3_wingman_front" }, --42
    { Vector(-2.6, 51.875,53.17), Angle(0,180,0), "code3_wingman_front" }, --43	
	
--Other front lights
	--in light
	{ Vector(27.389, 115.206,33.07), Angle(-4.8,-23.5,0), "headlight_led" }, --44	
	{ Vector(-27.389, 115.206,33.07), Angle(4.8,23.5,0), "headlight_led" }, --45		
	--fog
	{ Vector(31, 111.8,18.078), Angle(0,-31.6,0), "charger_foglights" }, --46
	{ Vector(-31, 111.8,18.078), Angle(0,31.6,0), "charger_foglights" }, --47
	
	}

EMV.Sections = {
	["sirenbox"] = {
		{ {1, G} },
		{ {2, G} },
		{ {3, G} },
		{ {4, G} },
		{ {5, G} },
		{ {6, G} },
		{ {7, G} },
		{ {8, G} },
		{ {9, G} },
		{ {10, G} },
		{ {11, G} },
		{ {12, G} },
		{ {13, G} },
		{ {14, G} },
		{ {15, G} },
	},
	["sirenboxtraffic"] = {
		{ {1, G} },
		{ {2, G} },
		{ {3, G} },
		{ {4, G} },
		{ {5, G} },
		{ {6, G} },
		{ {7, G} },
		{ {8, G} },
		{ {9, G} },
		{ {10, G} },
		{ {11, G} },
		{ {12, G} },
		{ {13, G} },
		{ {14, G} },
		{ {15, G} },
	},
	["sirenbox_lightbar"] = {
	{ {16,A}, {17,A}, {18,A}, {21,A}, {22,A}, {23,A} },
	--lefright
	{ {16,A}, {17,A} },	
	{ {22,A}, {23,A} },	
	--outer inner
	{ {16,A}, {23,A} },
	{ {17,A}, {18,A}, {21,A}, {22,A} },
	--alt sides in out
	{ {16,A}, {18,A}, {22,A},},
	{ {17,A}, {21,A}, {23,A} },
	--alt sides l r
	{ {18,A}, {22,A}, {23,A} },
	{ {16,A}, {17,A}, {21,A} },	
	--right traffic
	{ {16,A} },	
	{ {16,A}, {17,A} },	
	{ {16,A}, {17,A}, {18,A} },	
	{ {16,A}, {17,A}, {18,A}, {21,A} },	
	{ {16,A}, {17,A}, {18,A}, {21,A}, {22,A} },	
	{ {16,A}, {17,A}, {18,A}, {21,A}, {22,A}, {23,A} },	
	--left traffic
	{ {23,A} }, --10
	{ {22,A}, {23,A} },	
	{ {21,A}, {22,A}, {23,A} },	
	{ {18,A}, {21,A}, {22,A}, {23,A} },	
	{ {17,A}, {18,A}, {21,A}, {22,A}, {23,A} },	
	{ {16,A}, {17,A}, {18,A}, {21,A}, {22,A}, {23,A} },	--15
	--centre traffic
	{ {18,A}, {21,A} },
	{ {17,A}, {18,A}, {21,A}, {22,A} },
	{ {16,A}, {17,A}, {18,A}, {21,A}, {22,A}, {23,A} },
	},

	["code3wingman"] = {
	{ {26,A}, {27,A}, {28,A}, {29,A}, {30,A}, {31,A} },
	--left right
	{ {26,A}, {27,A} },
	{ {30,A}, {31,A} },
	--outer inner
	{ {26,A}, {31,A} },
	{ {27,A}, {28,A}, {29,A}, {30,A} },
	--alt sides in out
	{ {26,A}, {28,A}, {30,A} },
	{ {27,A}, {29,A}, {31,A} },
	--alt sides l r
	{ {28,A}, {30,A}, {31,A} },
	{ {26,A}, {27,A}, {29,A} },
	--right traffic
	{ {26,A} },
	{ {26,A}, {27,A} },
	{ {26,A}, {27,A}, {28,A} },
	{ {26,A}, {27,A}, {28,A}, {29,A} },
	{ {26,A}, {27,A}, {28,A}, {29,A}, {30,A} },
	{ {26,A}, {27,A}, {28,A}, {29,A}, {30,A}, {31,A} },
	--left traffic
	{ {31,A} },
	{ {30,A}, {31,A} },
	{ {29,A}, {30,A}, {31,A} },
	{ {28,A}, {29,A}, {30,A}, {31,A} },
	{ {27,A}, {28,A}, {29,A}, {30,A}, {31,A} },
	{ {26,A}, {27,A}, {28,A}, {29,A}, {30,A}, {31,A} },
	--centre traffic
	{ {28,A}, {29,A} },
	{ {27,A}, {28,A}, {29,A}, {30,A} },
	{ {26,A}, {27,A}, {28,A}, {29,A}, {30,A}, {31,A} },
	},
	["wigwags"] = {
	{ {24, CW}, {25, CW} },	
	{ {24, CW} },
	{ {25, CW} },
	{ {40, CW}, {41, CW} },	
	},
	["taillights"] = {
	
	{ {32,DR}, {33,DR}, {34,DR}, {35,DR}, {36,DR}, {37,DR}, {38,DR}, {39,DR} },
	{ {32,DR}, {33,DR}, {34,DR}, {35,DR} },
	{ {36,DR}, {37,DR}, {38,DR}, {39,DR} },
	
	{ {35,B}, {36,DR}, {37,DR}, {38,DR} },
	{ {32,DR}, {33,DR}, {34,DR}, {39,B} },
	
	{ {32,DR}, {33,DR}, {34,DR}, {36,DR}, {37,DR}, {38,DR} },
	{ {35,B}, {39,B} },
	},
	["frontwindow_lights"] = {
	{ {42, B}, {43, R} },	
	{ {42, B} },
	{ {43, R} },
	},
	["frontlights"] = {
	{ {44, R}, {45, B} },
	--top bottom
	{ {44, R}, {45, B} },
	{ {46, CW}, {47, CW} },
	--l r alternate sides
	{ {44, R}, {46, CW} },
	{ {45, B}, {47, CW} },
	--l r same side
	{ {44, R}, {47, CW} },
	{ {45, B}, {46, CW} },
	--l r small only
	{ {44, R} },
	{ {45, B} },
	}
}

EMV.Patterns = { -- 0 = blank
	["sirenbox"] = {
		["standby"] = {
			1
		},
		["rad"] = {
			2
		},
		["highpri"] = {
			3
		},
		["caution"] = {
			4
		},
		["stop"] = {
			5
		},
		["leftalley"] = {
			9
		},
		["takedown"] = {
			10
		},
		["rightalley"] = {
			11
		},
		["cruise"] = {
			12
		},
		["code1"] = {
			13
		},
		["code2"] = {
			14
		},
		["code3"] = {
			15
		},
	},
--------------------------------------------	
	["sirenboxtraffic"] = {
		["left"] = {
			6
		},
		["centre"] = {
			7
		},
		["right"] = {
			8
		},
	},
--------------------------------------------	
	["sirenbox_lightbar"] = {
		["code1"] = {
			2,0,0,2,0,0,2,0,0,3,0,0,3,0,0,3,0,0
		},
		["code2"] = {
			4,0,4,0,4,0,5,0,5,0,5,0
		},
		["code3"] = {
			6,0,6,0,6,0,7,0,7,0,7,0,
			6,0,6,0,6,0,7,0,7,0,7,0,
			6,0,6,0,6,0,7,0,7,0,7,0,
			8,0,8,0,8,0,9,0,9,0,9,0,
			8,0,8,0,8,0,9,0,9,0,9,0,
			8,0,8,0,8,0,9,0,9,0,9,0
		},
		["left_traffic"] = {
			10,10,11,11,12,12,13,13,14,14,15,15,0
		},
		["right_traffic"] = {
			16,16,17,17,18,18,19,19,20,20,21,21,0
		},
		["centre_traffic"] = {
			22,22,22,23,23,23,24,24,24,0
		},
		["stop"] = {
			4,4,4,4,5,5,5,5
		},
		["caution"] = {
			6,6,6,6,7,7,7,7
		},
	},
--------------------------------------------	
	["wigwags"] = {
		["cruise"] = {
			1
		},
		["code2"] = {
			2,0,2,0,2,0,3,0,3,0,3,0
		},
		["code3"] = {
			4
		},		
	},
--------------------------------------------	
	["code3wingman"] = {
		["code1"] = {
			2,0,0,2,0,0,2,0,0,3,0,0,3,0,0,3,0,0
		},
		["code2"] = {
			4,0,4,0,4,0,5,0,5,0,5,0
		},
		["code3"] = {
			6,0,6,0,6,0,7,0,7,0,7,0,
			6,0,6,0,6,0,7,0,7,0,7,0,
			6,0,6,0,6,0,7,0,7,0,7,0,
			8,0,8,0,8,0,9,0,9,0,9,0,
			8,0,8,0,8,0,9,0,9,0,9,0,
			8,0,8,0,8,0,9,0,9,0,9,0
		},
		["left_traffic"] = {
			10,10,11,11,12,12,13,13,14,14,15,15,0
		},
		["right_traffic"] = {
			16,16,17,17,18,18,19,19,20,20,21,21,0
		},
		["centre_traffic"] = {
			22,22,22,23,23,23,24,24,24,0
		},
		["stop"] = {
			4,4,4,4,5,5,5,5
		},
		["caution"] = {
			6,6,6,6,7,7,7,7
		},
	},
--------------------------------------------		
	["taillights"] = {
		["code1"] = {
			2,0,0,2,0,0,2,0,0,3,0,0,3,0,0,3,0,0
		},
		["code2"] = {
			4,0,4,0,4,0,5,0,5,0,5,0
		},
		["code3"] = {
			4,0,4,0,4,0,5,0,5,0,5,0,4,0,4,0,4,0,5,0,5,0,5,0,4,0,4,0,4,0,5,0,5,0,5,0,6,0,6,0,6,0,7,0,7,0,7,6,0,6,0,6,0,7,0,7,0,7,6,0,6,0,6,0,7,0,7,0,7
		},
		["stop"] = {
			7,7,7,7,6,6,6,6
		},
		["caution"] = {
			4,4,4,4,5,5,5,5
		},
	},
--------------------------------------------		
	["frontwindow_lights"] = {
		["code1"] = {
			2,2,2,3,3,3
		},
		["code2"] = {
			2,0,2,0,2,0,3,0,3,0,3,0
		},
		["code3"] = {
			2,0,2,0,3,0,3,0,2,0,2,0,3,0,3,0,2,0,2,0,3,0,3,0,1,0,1,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,1,0,1,0,0,0
		},
		["stop"] = {
			2,2,2,2,3,3,3,3
		},
		["caution"] = {
			3,3,3,3,2,2,2,2
		},
	},
--------------------------------------------	
	["frontlights"] = {
		["code1"] = {
			2,0,0,2,0,0,2,0,0,3,0,0,3,0,0,3,0,0
		},
		["code2"] = {
			6,0,6,0,6,0,7,0,7,0,7,0
		},
		["code3"] = {
			4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0
		},
		["stop"] = {
			9,9,9,9,8,8,8,8
		},
		["caution"] = {
			4,4,4,4,5,5,5,5
		},
	}
}

EMV.Sequences = {
		Sequences = {
		{
			Name = "CODE 1",
			Components = {
			["sirenbox"] = "code1",
			["sirenbox_lightbar"] = "code1",
			["frontlights"] = "code1",
			["taillights"] = "code1",
			["code3wingman"] = "code1",
			["frontwindow_lights"] = "code1"				
			},
			Disconnect = {}
		},
		{
			Name = "CODE 2",
			Components = {
			["sirenbox"] = "code2",
			["sirenbox_lightbar"] = "code2",
			["frontlights"] = "code2",
			["taillights"] = "code2",
			["code3wingman"] = "code2",
			["frontwindow_lights"] = "code2"				
			
			},
			Disconnect = {}
		},
		{
			Name = "CODE 3",
			Components = {
			["sirenbox"] = "code3",
			["sirenbox_lightbar"] = "code3",
			["frontlights"] = "code3",	
			["taillights"] = "code3",
			["wigwags"] = "code3",		
			["code3wingman"] = "code3",			
			["frontwindow_lights"] = "code3"				
			},
			Disconnect = {}
		},
		{
			Name = "STOP",
			Components = {
			["sirenbox"] = "stop",
			["sirenbox_lightbar"] = "stop",
			["taillights"] = "stop",
			["frontwindow_lights"] = "stop",
			["frontlights"] = "stop",
			["code3wingman"] = "stop"			
			},
			Disconnect = {}
		},
		{
			Name = "CAUTION",
			Components = {
			["sirenbox"] = "caution",
			["sirenbox_lightbar"] = "caution",
			["taillights"] = "caution",
			["frontwindow_lights"] = "caution",
			["frontlights"] = "caution",
			["code3wingman"] = "caution"	
			},
			Disconnect = {}
		},
	},
	Traffic = {
		{
			Name = "LEFT TRAFFIC",
			Components = {
			["sirenboxtraffic"] = "left",
			["sirenbox_lightbar"] = "left_traffic",
			["code3wingman"] = "left_traffic"	
			},
			Disconnect = {}
		},
		{
			Name = "CENTRE TRAFFIC",
			Components = {
			["sirenboxtraffic"] = "centre",
			["sirenbox_lightbar"] = "centre_traffic",
			["code3wingman"] = "centre_traffic"	
			},
			Disconnect = {}
		},
		{
			Name = "RIGHT TRAFFIC",
			Components = {
			["sirenboxtraffic"] = "right",
			["sirenbox_lightbar"] = "right_traffic",
			["code3wingman"] = "right_traffic"	
			},
			Disconnect = {}
		},
	},

}

EMV.Meta = {
	sirenbox_led = {
		AngleOffset = 90,
		W = 0.4,
		H = 0.4,
		Scale = 0.05,
		Sprite = "sprites/emv/led_single"
	},
	led_lightbar_side = {
		AngleOffset = -90,
		W = 11,
		H = 11,
		Scale = 0.8,
		WMult = 2,
		Sprite = "sprites/emv/emv_whelen_src_side"
	},
	led_lightbar_side_reverse = {
		AngleOffset = 90,
		W = 11,
		H = 11,
		Scale = 0.8,
		WMult = 2,
		Sprite = "sprites/emv/emv_whelen_src_side"
	},
	led_lightbar_front = {
		AngleOffset = -90,
		W = 7.5,
		H = 8.9,
		Scale = 0.8,
		WMult = 2,
		Sprite = "sprites/emv/emv_whelen_src"
	},
	led_lightbar_rear = {
		AngleOffset = 90,
		W = 7.5,
		H = 8.9,
		Scale = 0.8,
		WMult = 2,
		Sprite = "sprites/emv/emv_whelen_src"
	},
	takedown_lightbar_front = {
		AngleOffset = -90,
		W = 11.5,
		H = 9,
		Scale = 1,
		Sprite = "sprites/emv/lightbar"
	},
	takedown_lightbar_left = {
		AngleOffset = -90,
		W = 4.2,
		H = 4.2,
		Scale = 1,
		Sprite = "sprites/emv/circular_src"
	},
	grill_lights = {
		AngleOffset = -90,
		W = 6,
		H = 4,
		Scale = 0.6,
		Sprite = "sprites/emv/lightbar"
	},
	lamp = {
		AngleOffset = -90,
		W = 17,
		H = 17,
		Scale = 1,
		Sprite = "sprites/emv/circular_src"
	},
	headlight = {
		AngleOffset = -90,
		W = 10,
		H = 10,
		Scale = 1.1,
		WMult = 2,
		Sprite = "sprites/emv/circular_src"
	},
	code3_wingman = {
		AngleOffset = 90,
		W = 7.5,
		H = 7.5,
		Scale = 1,
		WMult = 2,
		Sprite = "sprites/emv/code3_wingman"
	},	
	code3_wingman_front = {
		AngleOffset = 90,
		W = 5.1,
		H = 4.3,
		Scale = 1,
		WMult = 2,
		Sprite = "sprites/emv/code3_wingman"
	},	
	invis = {
		AngleOffset = 90,
		W = 12,
		H = 7.5,
		Scale = 1,
		WMult = 2,
		Sprite = "sprites/emv/blank"
	},	
	tail_inner = {
		AngleOffset = 90,
		W = 8,
		H = 6,
		Scale = 1,
		Sprite = "sprites/emv/lightbar"
	},	
	headlight_l = {
		AngleOffset = "R",
		Scale = 1.1,
		W = 10,
		H = 10,
		WMult = 4,
		Sprite = "sprites/emv/circular_src",
		Speed = -6,
	},
	headlight_r = {
		AngleOffset = "R",
		Scale = 1.1,
		W = 10,
		H = 10,
		WMult = 4,
		Sprite = "sprites/emv/circular_src",
		Speed = 6,
	},
	headlight_led = {
		AngleOffset = -90,
		W = 4,
		H = 4,
		Scale = 1,
		Sprite = "sprites/emv/lightbar"
	},
	charger_foglights = {
		AngleOffset = -90,
		W = 12.2,
		H = 11,
		Scale = 0.6,
		Sprite = "sprites/emv/charger_foglights"
	},
}
EMV.Lamps = {
	["takedowns"] = {
		Color = Color(200,200,200,255),
		Texture = "effects/flashlight001",
		Near = 8,
		FOV = 90,
		Distance = 700,
	},
	["alley"] = {
		Color = Color(200,200,200,255),
		Texture = "effects/flashlight001",
		Near = 8,
		FOV = 80,
		Distance = 500,
	},
	["lamps"] = {
		Color = Color(200,200,200,255),
		Texture = "effects/flashlight001",
		Near = 8,
		FOV = 80,
		Distance = 1300,
	}
}

local PI = {}
PI.Meta = {
}
PI.Positions = {
}
PI.States = {}
PI.States.Headlights = {}
PI.States.Brakes = {}
PI.States.Blink_Left = {}
PI.States.Blink_Right = {}
PI.States.Reverse = {}
PI.States.Running = {}

local V = {
				// Required information
				Name =	name,
				Class = "prop_vehicle_jeep",
				Category = "Emergency Vehicles",

				// Optional information
				Author = "LoneWolfie, Schmal",
				Information = "vroom vroom",
				Model =	"models/lonewolfie/dodge_charger_2015_undercover.mdl",

			
				KeyValues = {				
						vehiclescript =	"scripts/vehicles/lwcars/dodge_charger_2015_police.txt"
					    },
				IsEMV = true,
				EMV = EMV,
				HasPhoton = true,
				Photon = PI
}

list.Set( "Vehicles", V.Name, V )

if EMVU then EMVU:OverwriteIndex( name, EMV ) end
if Photon then Photon:OverwriteIndex( name, PI ) end