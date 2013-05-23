--[[ Set up search path ]]
require("getScriptFilename")
fn = getScriptFilename()

print("This is " .. fn)


-- This line will error out if this script wasn't loaded from a file.
assert(fn, "Have to load this from file, not copy and paste, or we can't find our models!")


-- This will add the directory passed (or the parent directory of a file, such as fn)
-- to the model search path.
vrjLua.appendToModelSearchPath(fn)

--[[This allows transparent models]]
require("TransparentGroup")

--[[Set up Help Menu]]
dofile(vrjLua.findInModelSearchPath([[Effects/HelpMenu.lua]]))


--[[ Set up models ]]
blackengineering = Model[[component-models/Black Engineering Model/Black.osg]]
metalmodel = Model[[component-models/mechdyne-models/modified.osg]]
tread = Model[[component-models/mechdyne-models/tread.osg]]
serverrack = Model[[component-models/Server Rack/rack model.osg]]
walkwayandxray = Model[[component-models/Walkway/walkwayandxray.lwo.osg]]
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
cubicles = Model[[component-models/cubicles/cubicles.ive]]


--[[ Arrange models in space ]]
RelativeTo.World:addChild(
	Transform{
		position = {19.5, 0, 42.5},
		orientation = AngleAxis(Degrees(60), Axis{0.0, 1.0, 0.0}), 
		blackengineering
	}
)

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

groupedlights = Transform{
	position = {-4.3, 0, -1},
	orientation = AngleAxis(Degrees(-30), Axis{0.0, 1.0, 0.0}),
	lights
}

RelativeTo.World:addChild(groupedlights)

RelativeTo.World:addChild(
	Group{
		Transform{
			position = {1.69, .055, -.25},
			orientation = AngleAxis(Degrees(0), Axis{0.0, 0.0, 0.0}),
			scale = .00099,
			metalmodel
		},
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

RelativeTo.World:addChild(
	Transform{
		position = {.55, 1.22, -2.20},
		orientation = AngleAxis(Degrees(-5), Axis{0.0, 1.0, 0.0}),
		serverrack
	}
)

workspace = Group{

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

groupedworkspace = Transform{
	position = {-.4, .715, -1.4},
	orientation = AngleAxis(Degrees(-90), Axis{0.0, 1.0, 0.0}),
	workspace
	}

RelativeTo.World:addChild(groupedworkspace)

RelativeTo.World:addChild(
	Transform{
		position = {15.75, 2.75, 4},
		orientation = AngleAxis(Degrees(-120), Axis{0.0, 1.0, 0.0}),
		scale = .001,
		XrayFacility
	}
)

TenInchTube = Transform{
	position = {15.75, 2.75, 4},
	orientation = AngleAxis(Degrees(-120), Axis{0.0, 1.0, 0.0}),
	scale = .001,
	Model([[component-models/XrayFacility/TenInchTube.dae.osg]]),
}
TenInchTubeTrans = TransparentGroup{
	alpha = .35,
	TenInchTube
}
RelativeTo.World:addChild(TenInchTubeTrans)


RelativeTo.World:addChild(
	Transform{
		position = {7.75, 0.0, 11.675},
		orientation = AngleAxis(Degrees(-30), Axis{0.0, 1.0, 0.0}),
		scale = .001,
		RotatingAssm
	}
)

RelativeTo.World:addChild(
	Transform{
		position = {7.75, 0.0, 11.675},
		orientation = AngleAxis(Degrees(-30), Axis{0.0, 1.0, 0.0}),
		scale = .001,
		LiftingPlatform
	}
)

SixInchTube = Transform{
	position = {7.75, 0.0, 11.675},
	orientation = AngleAxis(Degrees(-30), Axis{0.0, 1.0, 0.0}),
	scale = .001,
	Model([[component-models/XrayFacility/SixInchTube.dae.osg]]),
}
SixInchTubeTrans = TransparentGroup{
	alpha = .35,
	SixInchTube
}
RelativeTo.World:addChild(SixInchTubeTrans)

RelativeTo.World:addChild(
	Transform{
		position = {7.75, 1, 11.675},
		orientation = AngleAxis(Degrees(-90), Axis{1.0, 0.0, 0.0}),
		scale = .1,
		Bubbles
	}
)

RelativeTo.World:addChild(
	Transform{
		position = {12.775, .05, 3.5},
		orientation = AngleAxis(Degrees(-90), Axis{1.0, 0.0, 0.0}),
		scale = .1,
		Bubbles
	}
)

RelativeTo.World:addChild(
	Transform{
		position = {-2, 0, 5.35},
		orientation = AngleAxis(Degrees(-120), Axis{0.0, 1.0, 0.0}),
		cubicles
	}
)

function getNamedChild(node, name)
	for i = 0, node:getNumChildren() - 1 do
		local child = node:getChild(i)
		print(child:getName())
		if child:getName() == name then
			return child
		end
	end
end

components = { }

for i = 0, metalmodel:getNumChildren() - 1 do
	local child = metalmodel:getChild(i)
	components[child:getName()] = child
end


--[[ Set up lighting ]]
dofile(vrjLua.findInModelSearchPath([[Effects/simpleLights.lua]]))


require("Actions")
require("TransparentGroup")

pointRadius = 0.0125

device = gadget.PositionInterface("VJWand")
local head = gadget.PositionInterface("VJHead")

--[[ Action for tracking position ]]
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
		local toggle_button = gadget.DigitalInterface("WMButtonMinus")
		while true do
			repeat
				Actions.waitForRedraw()
			until toggle_button.justPressed
				RelativeTo.World:setMatrix(osg.Matrixd.translate(0, 0, 0))
		end
	end
)

--[[ Action for switching visibility of METaL ]]
dofile(vrjLua.findInModelSearchPath([[Effects/VisibilityMETaL.lua]]))


--[[ Action for switching navigation in METaL ]]
dofile(vrjLua.findInModelSearchPath([[Effects/rotateWand.lua]]))
dofile(vrjLua.findInModelSearchPath([[Effects/NavWalkandFly.lua]]))


--[[This action allows user to draw and clear drawing]]
dofile(vrjLua.findInModelSearchPath([[Effects/Drawing.lua]]))
mydraw = DrawingTool{linewidth = (5)}
mydraw:startDrawing()


--[[ Set up sound ]]
function startSound()
	snx.changeAPI("Audiere")

	i = snx.SoundInfo()
	i.filename = vrjLua.findInModelSearchPath("aquascape_sunrise_recoded.mp3")

	i.ambient = true
	s = snx.SoundHandle("bgaudio")
	s:configure(i)
	s:trigger(-1)
end

--print("Run 'startSound()' to begin the audio")

--[[
do
	local image = Model(vrjLua.findInModelSearchPath("colorwithshadow_transparent_large.png"))

	local tex = osg.Texture2D(image)

	local ss = osg.StateSet()

	ss:setTextureAttributeAndModes(0, tex, osg.StateAttribute.Values.ON)

	GL_LIGHTING = 0x0B50
	ss:setMode(GL_LIGHTING, osg.StateAttribute.Values.OFF)
	local g = osg.Geometry()
	local coords=osg.Vec3Array(4)
end
]]