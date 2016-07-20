
-----------------------------------------------------
AddCSLuaFile()

local name = "Dodge Charger 2015 Pursuit"

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

EMV.Color = nil

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
	{ Vector(-3.2, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --From left to right 16
	{ Vector(-2.9, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --17
	{ Vector(-2.61, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --18
	{ Vector(-2.33, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --19
	{ Vector(-2.04, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --20
	{ Vector(-1.75, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --21
	{ Vector(-1.48, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --22
	{ Vector(-1.2, 11.32,sirenboxheight), Angle(0,0,90), "sirenbox_led" }, --23
--Whelen Liberty Lightbar
	--front
	{ Vector(-24.39, -11.11,lightbarheight), Angle(0,32.9,0), "led_lightbar_side" }, --24
	{ Vector(-16.05, -8.41,lightbarheight), Angle(0,0,0), "led_lightbar_front" }, --25
	{ Vector(-9.65, -8.41,lightbarheight), Angle(0,0,0), "led_lightbar_front" }, --26
	{ Vector(9.65, -8.41,lightbarheight), Angle(0,0,0), "led_lightbar_front" }, --27
	{ Vector(16.05, -8.41,lightbarheight), Angle(0,0,0), "led_lightbar_front" }, --28	
	{ Vector(24.39, -11.11,lightbarheight), Angle(0,-32.9,0), "led_lightbar_side" }, --29	
	--back
	{ Vector(-24.39, -18.71,lightbarheight), Angle(0,-32.9,0), "led_lightbar_side_reverse" }, --30
	{ Vector(-16.05, -21.31,lightbarheight), Angle(0,0,0), "led_lightbar_rear" }, --31
	{ Vector(-9.65, -21.31,lightbarheight), Angle(0,0,0), "led_lightbar_rear" }, --32	
	{ Vector(-3.26, -21.31,lightbarheight), Angle(0,0,0), "led_lightbar_rear" }, --33	
	{ Vector(3.26, -21.31,lightbarheight), Angle(0,0,0), "led_lightbar_rear" }, --34	
	{ Vector(9.65, -21.31,lightbarheight), Angle(0,0,0), "led_lightbar_rear" }, --35	
	{ Vector(16.05, -21.31,lightbarheight), Angle(0,0,0), "led_lightbar_rear" }, --36	
	{ Vector(24.39, -18.71,lightbarheight), Angle(0,32.9,0), "led_lightbar_side_reverse" }, --37
	--takedownfront
	{ Vector(3.26, -8.41,lightbarheight), Angle(0,0,0), "takedown_lightbar_front" }, --38
	{ Vector(-3.26, -8.41,lightbarheight), Angle(0,0,0), "takedown_lightbar_front" }, --39	
	--takwdownsides
	{ Vector(-28.46, -14.9,lightbarheight), Angle(0,90,0), "takedown_lightbar_left" }, --40	left
	{ Vector(28.46, -14.9,lightbarheight), Angle(0,-90,0), "takedown_lightbar_left" }, --41	right
--Grill lights
	{ Vector(-16.898, 119.757,36.787), Angle(0,12,0), "grill_lights" }, --42 ll
	{ Vector(16.898, 119.757,36.787), Angle(0,-12,0), "grill_lights" }, --43 rr	
	{ Vector(-7.854, 120.97,36.789), Angle(0,5.7,0), "grill_lights" }, --44 lm	
	{ Vector(7.854, 120.97,36.789), Angle(0,-5.7,0), "grill_lights" }, --45 rm	
--Lamps	
	{ Vector(41.9, 42.9,62.294), Angle(0,8.8,-6), "lamp" }, --46 r
	{ Vector(-41.9, 42.9,62.294), Angle(0,-8.8,-6), "lamp" }, --47 l	
--Wig wags	
	{ Vector(-37.26, 108.101,35.95), Angle(0,0,0), "headlight" }, --48		
	{ Vector(37.26, 108.101,35.95), Angle(0,0,0), "headlight" }, --49
--Code 3 Wingman
	{ Vector(23.88, -84.2,57.27), Angle(0,17,0), "code3_wingman" }, --50	
	{ Vector(16.077, -86.321,57.34), Angle(0,11.3,0), "code3_wingman" }, --51 	
	{ Vector(7.99, -87.38,57.34), Angle(0,3.3,0), "code3_wingman" }, --52
	
	{ Vector(-7.99, -87.38,57.34), Angle(0,-3.3,0), "code3_wingman" }, --53 	
	{ Vector(-16.077, -86.321,57.34), Angle(0,-11.3,0), "code3_wingman" }, --54 	
	{ Vector(-23.88, -84.2,57.27), Angle(0,-17,0), "code3_wingman" }, --55 	
--Tail lights
	--l
	{ Vector(-37.282, -114.517,45.0), Angle(0,-35.9,0), "code3_wingman" }, --56 	
	{ Vector(-34.784, -116.361,45.0), Angle(0,-30.3,0), "invis" }, --57	light point fix
	{ Vector(-31.914, -117.614,45.0), Angle(0,-23.5,0), "code3_wingman" }, --58	
	{ Vector(-26.562, -119.535,45.1), Angle(0,-14.7,0), "tail_inner" }, --59	
	---r
	{ Vector(37.282, -114.517,45.0), Angle(0,35.9,0), "code3_wingman" }, --60	
	{ Vector(34.784, -116.361,45.0), Angle(0,30.3,0), "invis" }, --61 light point fix
	{ Vector(31.914, -117.614,45.0), Angle(0,23.5,0), "code3_wingman" }, --62 	
	{ Vector(26.562, -119.535,45.1), Angle(0,14.7,0), "tail_inner" }, --63 	
--headlights
	{ Vector(-37.26, 108.101,35.95), Angle(0,0,0), "headlight_l" }, --64		
	{ Vector(37.26, 108.101,35.95), Angle(0,0,0), "headlight_r" }, --65


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
		{ {16, A}, {17, A},{18, A},{19, A},{20, A},{21, A},{22, A},{23, A}},	
		--outer edges
		{ {16, A}, {17, A} }, 
		{ {22, A}, {23, A} },
		--leftright all
		{ {16, A}, {17, A},{18, A},{19, A} },
		{ {20, A}, {21, A},{22, A},{23, A} },	
		--divide in 2, alternate sides
		{ {16, A}, {17, A}, {20, A},{21, A}},	
		{ {18, A}, {19, A}, {22, A},{23, A}},	
		--centre outer alternate
		{ {16, A}, {19, A}, {21, A},{22, A} },
		{ {17, A},{18, A}, {20, A}, {23, A} },
		--outside inside
		{ {16, A}, {17, A}, {22, A},{23, A} },	
		{ {18, A}, {19, A}, {20, A},{21, A} },	
		--left traffic
		{ {23, A}},		--12	
		{ {22, A},{23, A}},		
		{ {21, A},{22, A},{23, A}},	
		{ {18, A}, {21, A},{22, A},{23, A}},		
		{ {17, A},{18, A}, {21, A},{22, A},{23, A}},	
		{ {16, A}, {17, A},{18, A}, {21, A},{22, A},{23, A}},		--17
		--right traffic
		{ {16, A} },	--18
		{ {16, A}, {17, A} },		
		{ {16, A}, {17, A},{18, A} },	
		{ {16, A}, {17, A},{18, A}, {21, A} },	
		{ {16, A}, {17, A},{18, A}, {21, A},{22, A} },		
		{ {16, A}, {17, A},{18, A}, {21, A},{22, A},{23, A}},		
		--centre traffic
		{ {18, A}, {21, A} },	
		{ {17, A},{18, A}, {21, A},{22, A} },	
		{ {16, A}, {17, A},{18, A}, {21, A},{22, A},{23, A}},		
		--driver sf pattern
		{ {16, A} },	--28
		{ {23, A} },	
		{ {18, A},{20, A} },	
		{ {19, A},{21, A} },	--31
	},
	["lightbar"] = {
		{ {24, R}, {25, R}, {26, R}, {27, B}, {28, B}, {29, B}, {30, R}, {31, R}, {32, R}, {33, R}, {34, B}, {35, B}, {36, B}, {37, B}  },
		--outer edges
		{ {24,R}, {25,R}, {30,R}, {31,R} },
		{ {28,B}, {29,B}, {36,B}, {37,B} },
		--leftright all
		{ {24, R}, {25, R}, {26, R}, {30, R}, {31, R}, {32, R}, {33, R} },
		{ {27, B}, {28, B}, {29, B}, {34, B}, {35, B}, {36, B}, {37, B}  },
		--divide in 2, alternate sides
		{ {24, R}, {27, B}, {28, B}, {30, R}, {31, R}, {34, B}, {35, B} },
		{ {25, R}, {26, R}, {29, B}, {32, R}, {33, R}, {36, B}, {37, B} },
		--centre outer alternate
		{ {24, R}, {26, R}, {28, B}, {30, R}, {33, R}, {35, B}, {36, B} },
		{ {27, B}, {29, B}, {25, R}, {31, R}, {32, R}, {34, B}, {37, B} },
		--outside inside
		{ {24, R}, {26, R}, {27, B}, {29, B}, {30, R}, {31, R}, {36, B}, {37, B} },
		{ {25, R}, {28, B}, {32, R}, {33, R}, {34, B}, {35, B} },
		--driver sf pattern
		{ {24, R}, {30, R} }, --corner red 12
		{ {29, B}, {37, B} }, --corner blue 13 
		{  {25, R}, {27, B},  {32, R}, {34, B} }, -- inner 1 14
		{  {26, R}, {28, B},  {33, R}, {35, B} }, -- inner 2 15
	},
	["grilllights"] = {
		{ {42, B}, {43, R}, {44, B}, {45, R} },
		--leftleftrightright
		{ {43, R}, {45, R} },
		{ {42, B}, {44, B} },
		--outin
		{ {42, B}, {43, R} },
		{ {44, B}, {45, R} },
		--divide in 2, alternate sides
		{ {42, B}, {45, R} },
		{ {43, R}, {44, B} },
	},
	["code3wingman"] = {
		{ {50, A}, {51, A}, {52, A}, {53, A}, {54, A}, {55, A} },
	--leftright outer 2
		{ {50, A}, {51, A} },
		{ {54, A}, {55, A} },
	--leftright all
		{ {50, A}, {51, A}, {52, A} },
		{ {53, A}, {54, A}, {55, A} },
	--outer inner
		{ {50, A}, {51, A}, {54, A}, {55, A} },	
		{ {52, A}, {53, A} },
	--divide in 2, inner outer
		{ {50, A},  {52, A}, {53, A}, {55, A} },	
		{ {51, A},  {54, A} },
	--divide in 2, inner outer alternate
		{ {51, A}, {53, A}, {55, A} },	
		{ {50, A}, {52, A}, {54, A} },
	--divide in 2, left right 
		{ {50, A}, {51, A}, {53, A} },
		{ {52, A}, {54, A}, {55, A} },
	--left traffic
		{ {50, A} }, --14
		{ {50, A}, {51, A} },
		{ {50, A}, {51, A}, {52, A} },
		{ {50, A}, {51, A}, {52, A}, {53, A} },
		{ {50, A}, {51, A}, {52, A}, {53, A}, {54, A} },
		{ {50, A}, {51, A}, {52, A}, {53, A}, {54, A}, {55, A} }, --19
	--right traffic
		{ {55, A} },
		{ {54, A}, {55, A} },
		{ {53, A}, {54, A}, {55, A} },
		{ {52, A}, {53, A}, {54, A}, {55, A} },
		{ {51, A}, {52, A}, {53, A}, {54, A}, {55, A} },
		{ {50, A}, {51, A}, {52, A}, {53, A}, {54, A}, {55, A} },
	--centre traffic
		{ {52, A}, {53, A} },
		{ {51, A}, {52, A}, {53, A}, {54, A} },
		{ {50, A}, {51, A}, {52, A}, {53, A}, {54, A}, {55, A} },
	},
	["wigwags"] = {
		{ {48,CW}, {49,CW} },
		{ {48,CW, 2}, {49,CW, 0}  },
		{ {49,CW, 2}, {48,CW, 0} },
		{ {64,CW}, {65,CW} },
	},
	["taillights"] = {
		{ {56,DR}, {57,DR}, {58,DR}, {59,DR}, {60,DR}, {61,DR}, {62,DR}, {63,DR} },
		{ {56,DR}, {57,DR}, {58,DR}, {59,DR} },
		{ {60,DR}, {61,DR}, {62,DR}, {63,DR} },
		{ {56,DR}, {57,DR}, {58,DR}, {63,B} },
		{ {60,DR}, {61,DR}, {62,DR}, {59,B} },
		{ {56,DR}, {57,DR}, {58,DR}, {60,DR}, {61,DR}, {62,DR} },
		{ {59,B}, {63,B} },
		{ {59,B} },
		{ {63,B} },
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
		["highpri"] = {
			1,0
		},
		["cruise"] = {
			1
		},
		["code1"] = {
			2,0,2,0,3,0,3,0
		},
		["code2"] = {
			4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0
		},
		["code3"] = {
			4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0,8,0,8,0,9,0,9,0,8,0,8,0,9,0,9,0,8,0,8,0,9,0,9,0,10,0,10,0,11,0,11,0,10,0,10,0,11,0,11,0,10,0,10,0,11,0,11,0
		},
		["lefttraffic"] = {
			0,12,12,13,13,14,14,15,15,16,16,17,17
		},
		["righttraffic"] = {
			0,18,18,19,19,20,20,21,21,22,22,23,23
		},
		["centretraffic"] = {
			0,24,24,24,25,25,25,26,26,26
		},
		["stop"] = {
			10,10,10,11,11,11
		},
		["caution"] = {
			6,6,6,7,7,7,
		},
		["driversf"] = {
			27,27,28,28,29,0,29,0,28,28,27,27,30,0,30,0
		},	
	},
--------------------------------------------		
	["lightbar"] = {
		["cruise"] = {
			1
		},
		["code1"] = {
			2,0,2,0,3,0,3,0
		},
		["code2"] = {
			4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0
			},
		["code3"] = {
			4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0,8,0,8,0,9,0,9,0,8,0,8,0,9,0,9,0,8,0,8,0,9,0,9,0,10,0,10,0,11,0,11,0,10,0,10,0,11,0,11,0,10,0,10,0,11,0,11,0
		},
		["traffic"] = {
			4,0,4,0,5,0,5,0
		},
		["stop"] = {
			10,10,10,11,11,11
		},
		["caution"] = {
			6,6,6,7,7,7,
		},
		["highpri"] = {
			1,0
		},
		["driversf"] = {
			12,12,13,13,14,0,14,0,13,13,12,12,15,0,15,0
		},
	},
--------------------------------------------		
	["grilllights"] = {
		["highpri"] = {
			2,2,3,3,1,0,1,0,3,3,2,2,1,0,1,0
		},
		["cruise"] = {
			1
		},
		["code2"] = {
			2,0,2,0,3,0,3,0,2,0,2,0,3,0,3,0,2,0,2,0,3,0,3,0,4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0
		},
		["code3"] = {
			2,0,2,0,3,0,3,0,2,0,2,0,3,0,3,0,2,0,2,0,3,0,3,0,4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0,2,2,2,2,3,3,3,3,2,2,2,2,3,3,3,3,2,2,2,2,3,3,3,3
		},
		["traffic"] = {
			4,0,4,0,5,0,5,0
		},
		["caution"] = {
			7,7,7,6,6,6
		},
		["stop"] = {
			4,4,4,5,5,5
		},
	},
--------------------------------------------	
	["wigwags"] = {
		["cruise"] = {
			1
		},
		["rotator"] = {
			4
		},
		["driversf"] = {
			2,2,3,3,1,0,1,0,3,3,2,2,1,0,1,0
		},
	},
--------------------------------------------	
	["code3wingman"] = {
		["highpri"] = {
			1,0
		},
		["cruise"] = {
			1
		},
		["code1"] = {
			2,0,2,0,3,0,3,0
		},
		["code2"] = {
			4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0
		},
		["code3"] = {
			4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,12,0,12,0,13,0,13,0,12,0,12,0,13,0,13,0,12,0,12,0,13,0,13,0,10,0,10,0,11,0,11,0,10,0,10,0,11,0,11,0,10,0,10,0,11,0,11,0,8,0,8,0,9,0,9,0,8,0,8,0,9,0,9,0,8,0,8,0,9,0,9,0
		},
		["lefttraffic"] = {
			0,14,14,15,15,16,16,17,17,18,18,19,19
		},
		["righttraffic"] = {
			0,20,20,21,21,22,22,23,23,24,24,25,25
		},
		["centretraffic"] = {
			0,26,26,26,27,27,27,28,28,28
		},
		["stop"] = {
			7,7,7,6,6,6
		},
		["caution"] = {
			12,12,12,13,13,13
		},
	},
--------------------------------------------		
	["taillights"] = {
		["code1"] = {
			8,0,8,0,9,0,9,0
		},
		["code2"] = {
			2,0,2,0,3,0,3,0
		},
		["code3"] = {
			4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,4,0,4,0,5,0,5,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0,6,0,6,0,7,0,7,0
		},
		["cruise"] = {
			1
		},
		["stop"] = {
			6,6,6,7,7,7
		},
		["caution"] = {
			4,4,4,5,5,5
		},
		["hipri"] = {
			2,2,3,3,1,0,1,0,3,3,2,2,1,0,1,0
		},
	}
}

EMV.Sequences = {
		Sequences = {
		{
			Name = "CODE 1",
			Components = {
			["sirenbox"] = "code1",
			["lightbar"] = "code1",
			["sirenbox_lightbar"] = "code1",
			["code3wingman"] = "code1"
			},
			Disconnect = {}
		},
		{
			Name = "CODE 2",
			Components = {
			["sirenbox"] = "code2",
			["lightbar"] = "code2",
			["sirenbox_lightbar"] = "code2",
			["grilllights"] = "code2",
			["taillights"] = "code1",
			["code3wingman"] = "code2"
			},
			Disconnect = {}
		},
		{
			Name = "CODE 3",
			Components = {
			["sirenbox"] = "code3",
			["lightbar"] = "code3",
			["sirenbox_lightbar"] = "code3",
			["grilllights"] = "code3",
			["code3wingman"] = "code3",
			["wigwags"] = "rotator",
			["taillights"] = "code3"
			},
			Disconnect = {}
		},
		{
			Name = "URGENT",
			Components = {
			["sirenbox"] = "highpri",
			["lightbar"] = "driversf",
			["sirenbox_lightbar"] = "driversf",
			["grilllights"] = "highpri",
			["wigwags"] = "driversf",
			["taillights"] = "hipri"
			},
			Disconnect = {}
		},

		{
			Name = "STOP",
			Components = {
			["sirenbox"] = "stop",
			["lightbar"] = "stop",
			["grilllights"] = "stop",
			["sirenbox_lightbar"] = "stop",
			["code3wingman"] = "stop",
			["taillights"] = "stop"
			},
			Disconnect = {}
		},
		{
			Name = "CAUTION",
			Components = {
			["sirenbox"] = "caution",
			["lightbar"] = "caution",
			["sirenbox_lightbar"] = "caution",
			["grilllights"] = "caution",
			["taillights"] = "caution",
			["code3wingman"] = "caution"
			},
			Disconnect = {}
		},
		{
			Name = "CRUISE",
			Components = {
			["sirenbox"] = "cruise",
			["lightbar"] = "cruise",
			["sirenbox_lightbar"] = "cruise",
			["grilllights"] = "cruise",
			["wigwags"] = "cruise",
			["code3wingman"] = "cruise",
			["taillights"] = "cruise"
			},
			Disconnect = {}
		},
	},
	Traffic = {
		{
			Name = "LEFT TRAFFIC",
			Components = {
			["sirenboxtraffic"] = "left",
			["sirenbox_lightbar"] = "lefttraffic",
			["code3wingman"] = "lefttraffic",
			},
			Disconnect = {}
		},
		{
			Name = "CENTRE TRAFFIC",
			Components = {
			["sirenboxtraffic"] = "centre",
			["sirenbox_lightbar"] = "centretraffic",
			["code3wingman"] = "centretraffic",
			},
			Disconnect = {}
		},
		{
			Name = "RIGHT TRAFFIC",
			Components = {
			["sirenboxtraffic"] = "right",
			["sirenbox_lightbar"] = "righttraffic",
			["code3wingman"] = "righttraffic",
			},
			Disconnect = {}
		},
	},
	Illumination = {
		{
			Name = "LAMPS",
			Components = {
				{ 46, W, 3 }, { 47, W, 3 }
			},
			Lights = {
				{ Vector(41.9, 42.9,62.294), Angle( 20, 90, 0 ), "takedowns" },
				{ Vector(-41.9, 42.9,62.294), Angle( 20, 90, 0 ), "takedowns" },
			},
			Disconnect = { }
		},
		{
			Name = "TAKEDOWN",
			Components = {
				{ 38, CW, 3 }, { 39, W, 3 }, { 10, G }
			},
			Lights = {
				{ Vector( -3.26, -8.41,lightbarheight), Angle( 0, 90, 0 ), "lamps" },
				{ Vector( 3.26, -8.41,lightbarheight), Angle( 0, 90, 0 ), "lamps" },
			},
			Disconnect = { }
		},
		{
			Name = "RIGHT ALLEY",
			Components = {
				{ 41, CW, 3 }, { 11, G }
			},
			Lights = {

				{ Vector( 28.46, -14.9,lightbarheight), Angle( 20, 0, 0 ), "alley" },
			},
			Disconnect = { }
		},
		{
			Name = "LEFT ALLEY",
			Components = {
				{ 40, CW, 3 }, { 9, G }
			},
			Lights = {
				{ Vector(-28.46, -14.9,lightbarheight), Angle( 20, 180, 0 ), "alley" },
			},
			Disconnect = { }
		},
		{
			Name = "SCENE ILLUMINATION",
			Components = {
				{ 46, W, 3 }, { 47, W, 3 }, { 40, CW, 3 }, { 9, G }, { 41, CW, 3 }, { 11, G }, { 38, CW, 3 }, { 39, W, 3 }, { 10, G }
			},
			Lights = {
				{ Vector(-28.46, -14.9,lightbarheight), Angle( 20, 180, 0 ), "alley" },
				{ Vector( 28.46, -14.9,lightbarheight), Angle( 20, 0, 0 ), "alley" },
				{ Vector( -3.26, -8.41,lightbarheight), Angle( 0, 90, 0 ), "lamps" },
				{ Vector( 3.26, -8.41,lightbarheight), Angle( 0, 90, 0 ), "lamps" },
				{ Vector(41.9, 42.9,62.294), Angle( 20, 90, 0 ), "takedowns" },
				{ Vector(-41.9, 42.9,62.294), Angle( 20, 90, 0 ), "takedowns" },
				},
			Disconnect = { }
		},
	}
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
				Model =	"models/lonewolfie/dodge_charger_2015_police.mdl",

			
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