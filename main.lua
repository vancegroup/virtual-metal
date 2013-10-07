require("Actions")
require("TransparentGroup")
require ("getScriptFilename")
vrjLua.appendToModelSearchPath(getScriptFilename())

--[[ Background music - run startSound() to start it ]]
dofile(vrjLua.findInModelSearchPath[[Effects/BackgroundMusic.lua]])

-- [[ Action for switching navigation in METaL ]]
dofile(vrjLua.findInModelSearchPath[[vEffects/Navigation.lua]])

--[[Set up Help Menu]]
dofile(vrjLua.findInModelSearchPath[[Effects/HelpMenu.lua]])

--[[This action allows user to draw and clear drawing]]
dofile(vrjLua.findInModelSearchPath[[Effects/Drawing.lua]])
mydraw = DrawingTool{metal = true, linewidth = (5)}
mydraw:startDrawing()

--[[ Set up models ]]
blackengineering = Transform{
	position = {19.5, 0, 42.5},
	orientation = AngleAxis(Degrees(60), Axis{0.0, 1.0, 0.0}),
	Model[[component-models/Black Engineering Model/Black.osg]]
}
RelativeTo.World:addChild(blackengineering)
metalmodel = Model[[component-models/mechdyne-models/modified.osg]]
tread = Model[[component-models/mechdyne-models/tread.osg]]
serverrack = Model[[component-models/Server Rack/rack model.osg]]
XrayFacility = Transform{
	position = {15.75, 2.75, 4},
	orientation = AngleAxis(Degrees(-120), Axis{0.0, 1.0, 0.0}),
	scale = .001,
	Model[[component-models/XrayFacility/XrayFacility.dae.osg]]
}
RelativeTo.World:addChild(XrayFacility)
RotatingAssm = Model[[component-models/XrayFacility/RotatingAssm.dae.osg]]
LiftingPlatform = Model[[component-models/XrayFacility/LiftingPlatform.dae.osg]]
Bubbles = Model[[component-models/Bubbles/Bubbles.osg]]
desk = Model[[component-models/Desk/Desk.lwo.osg]]
monitor = Model[[component-models/Monitor/Monitor.lwo.osg]]
touchpanel = Model[[component-models/AMX NXT-CV10 Touch Panel/Touch Panel Assembly.lwo.osg]]
keyboard = Model[[component-models/Keyboard/Keyboard.lwo.osg]]
mouse = Model[[component-models/Wireless Mouse/Wireless Mouse.osg]]
glassesandtarget = Model[[component-models/Glasses Target/Glasses Target.lwo.osg]]
treetarget = Model[[component-models/Tree Target/Tree Target Assembly (with Wiimote).lwo.osg]]
clawtarget = Model[[component-models/Claw Target/Claw Target.lwo.osg]]
handtarget = Model[[component-models/Hand Target/Hand Target.lwo.osg]]
aeronchair = Model[[component-models/Aeron Chair/HMI_Aeron_Chair_3D.osg]]
fluorescent1 = Model[[component-models/Lights/Fluorescent1.osg]]
fluorescent2 = Model[[component-models/Lights/Fluorescent2.osg]]
fluorescent3 = Model[[component-models/Lights/Fluorescent3.osg]]
cubicles = Model[[component-models/Cubicles/cubicles.ive]]


--[[ Arrange models in space ]]
lights = Group{
	Transform{
		position = {3.5, 4.35, 7.5},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		fluorescent1
	},

	Transform{
		position = {6.9, 4.35, 7.75},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		fluorescent2
	},

	Transform{
		position = {9.2, 4.35, 7.75},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		fluorescent2
	},

	Transform{
		position = {12.5, 4.35, 7.75},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		fluorescent2
	},

	Transform{
		position = {16, 5.7, 1.5},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		fluorescent3
	},

	Transform{
		position = {18, 5.7, 1.5},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		fluorescent3
	},
}

RelativeTo.World:addChild(
	Transform{
		position = {-4.3, 0, -1},
		orientation = AngleAxis(Degrees(-30), Axis{0.0, 1.0, 0.0}),
		lights
	}
)

RelativeTo.World:addChild(
	Transform{
		position = {1.69, .055, -.25},
		orientation = AngleAxis(Degrees(0), Axis{0.0, 0.0, 0.0}),
		scale = .00099,
		metalmodel
	}
)

RelativeTo.World:addChild(
	Transform{
		position = {0, .0125, 2.725},
		orientation = AngleAxis(Degrees(-90), Axis{0.0, 1.0, 0.0}),
		scale = .79,
		tread
	}
)

--[[RelativeTo.World:addChild(
	Transform{
		position = {.55, 1.22, -2.20},
		orientation = AngleAxis(Degrees(-5), Axis{0.0, 1.0, 0.0}),
		serverrack
	}
)]]

workspace = Transform{	
	position = {-.4, .715, -1.4},
	orientation = AngleAxis(Degrees(-90), Axis{0.0, 1.0, 0.0}),

	Transform{
		position = {.1, 0, .25},
		orientation = AngleAxis(Degrees(0), Axis{0.0, 0.0, 0.0}),
		desk
	},

	Transform{
		position = {1.63, 0, .25},
		orientation = AngleAxis(Degrees(0), Axis{0.0, 0.0, 0.0}),
		desk
	},

	Transform{
		position = {.54, 0, 0},
		orientation = AngleAxis(Degrees(10), Axis{0.0, 1.0, 0.0}),
		monitor
	},

	Transform{
		position = {1.08, 0, -.07},
		orientation = AngleAxis(Degrees(5), Axis{0.0, 1.0, 0.0}),
		monitor
	},

	Transform{
		position = {1.64, 0, -.07},
		orientation = AngleAxis(Degrees(-5), Axis{0.0, 1.0, 0.0}),
		monitor
	},

	Transform{
		position = {2.18, 0, 0},
		orientation = AngleAxis(Degrees(-10), Axis{0.0, 1.0, 0.0}),
		monitor
	},

	Transform{
		position = {2.25, .005, .28},
		orientation = AngleAxis(Degrees(-40), Axis{0.0, 1.0, 0.0}),
		touchpanel
	},

	Transform{
		position = {1.4, 0, .45},
		orientation = AngleAxis(Degrees(-90), Axis{0.0, 1.0, 0.0}),
		keyboard
	},

	Transform{
		position = {2.1, 0, .55},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		mouse
	},

	Transform{
		position = {1, -.03, .65},
		orientation = AngleAxis(Degrees(180), Axis{0.0, 1.0, 0.0}),
		glassesandtarget
	},

	Transform{
		position = {.95, 0, .5},
		orientation = AngleAxis(Degrees(0), Axis{0.0, 0.0, 0.0}),
		treetarget
	},

	Transform{
		position = {.45, .075, .6},
		orientation = AngleAxis(Degrees(180), Axis{0.0, 0.0, 1.0}),
		clawtarget
	},

	Transform{
		position = {.6, -.065, .55},
		orientation = AngleAxis(Degrees(180), Axis{0.0, 1.0, 0.0}),
		handtarget
	},

	Transform{
		position = {1.9, -.755, 1.9},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		aeronchair
	}
}
RelativeTo.World:addChild(workspace)

TenInchTube = TransparentGroup{
	alpha = .15,
	Transform{
		position = {15.75, 2.75, 4},
		orientation = AngleAxis(Degrees(-120), Axis{0.0, 1.0, 0.0}),
		scale = .001,
		Model([[component-models/XrayFacility/TenInchTube.dae.osg]]),
	}
}
RelativeTo.World:addChild(TenInchTube)
TenInchTube_ss = TenInchTube:getOrCreateStateSet()

-- Render the tube after the bubbles
TenInchTube_ss:setRenderBinDetails(80, "RenderBin")


RotatingAssm = Transform{
	position = {7.75, 0.0, 11.675},
	orientation = AngleAxis(Degrees(-30), Axis{0.0, 1.0, 0.0}),
	scale = .001,
	Model([[component-models/XrayFacility/RotatingAssm.dae.osg]])
}
RelativeTo.World:addChild(RotatingAssm)

anglesPerSecond = 3
Actions.addFrameAction(
	function(dt)
		local angle = 0
		while true do
			while angle < 465 do
				angle = angle + anglesPerSecond * dt
				RotatingAssm.Attitude = AngleAxis(Degrees(angle), Axis{0, 1, 0})
				dt = Actions.waitForRedraw()
			end
			while angle > 135 do
				angle = angle - anglesPerSecond * dt
				RotatingAssm.Attitude = AngleAxis(Degrees(angle), Axis{0, 1, 0})
				dt = Actions.waitForRedraw()
			end
		end
	end
)

RelativeTo.World:addChild(
	Transform{
		position = {7.75, 0.0, 11.675},
		orientation = AngleAxis(Degrees(-30), Axis{0.0, 1.0, 0.0}),
		scale = .001,
		LiftingPlatform
	}
)

SixInchTube = TransparentGroup{
	alpha = .15,
	Transform{
		position = {7.75, 0.0, 11.675},
		orientation = AngleAxis(Degrees(-30), Axis{0.0, 1.0, 0.0}),
		scale = .001,
		Model([[component-models/XrayFacility/SixInchTube.dae.osg]]),
	}
}
RelativeTo.World:addChild(SixInchTube)
SixInchTube_ss = SixInchTube:getOrCreateStateSet()

-- Render the tube after the bubbles
SixInchTube_ss:setRenderBinDetails(80, "RenderBin")


Bubbles1 = Transform{
	position = {7.75, 1, 11.675},
	orientation = AngleAxis(Degrees(-90), Axis{1.0, 0.0, 0.0}),
	scale = .1,
	Model([[component-models/Bubbles/Bubbles.osg]]),
}
RelativeTo.World:addChild(Bubbles1)
Bubbles1_ss = Bubbles1:getOrCreateStateSet()

-- Render the bubbles before the transparent tubes
Bubbles1_ss:setRenderBinDetails(40, "RenderBin")


Bubbles2 = Transform{
	position = {12.775, .05, 3.5},
	orientation = AngleAxis(Degrees(-90), Axis{1.0, 0.0, 0.0}),
	scale = .1,
	Model([[component-models/Bubbles/Bubbles.osg]]),
}
RelativeTo.World:addChild(Bubbles2)
Bubbles2_ss = Bubbles2:getOrCreateStateSet()

-- Render the bubbles before the transparent tubes
Bubbles2_ss:setRenderBinDetails(40, "RenderBin")


RelativeTo.World:addChild(
	Transform{
		position = {-2, 0, 5.35},
		orientation = AngleAxis(Degrees(-120), Axis{0.0, 1.0, 0.0}),
		cubicles
	}
)

--[[ Set up lighting ]]
dofile(vrjLua.findInModelSearchPath[[Effects/simpleLights.lua]])
pointRadius = 0.0125

device = gadget.PositionInterface("VJWand")
local head = gadget.PositionInterface("VJHead")

--[[ Action for tracking position of head ]]
updatepositionTrack = function()
	while true do
		track = RelativeTo.World:getInverseMatrix():preMult(head.position)
		Actions.waitForRedraw()
	end
end
Actions.addFrameAction(updatepositionTrack)


--[[ Action for returning to the starting position ]]
Actions.addFrameAction(
	function()
		local toggle_button = gadget.DigitalInterface("WMButtonHome")
		while true do
			repeat
				Actions.waitForRedraw()
			until toggle_button.justPressed
				RelativeTo.World:setMatrix(osg.Matrixd.translate(0, 0, 0))
		end
	end
)

--[[ Action for switching visibility of METaL ]]
dofile(vrjLua.findInModelSearchPath[[Effects/VisibilityMETaL.lua]])