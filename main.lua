--[[ Set up search path ]]
require("getScriptFilename")
fn = getScriptFilename()

print("This is " .. fn)

-- This line will error out if this script wasn't loaded from a file.
assert(fn, "Have to load this from file, not copy and paste, or we can't find our models!")

-- This will add the directory passed (or the parent directory of a file, such as fn)
-- to the model search path.
vrjLua.appendToModelSearchPath(fn)

--[[Set up Help Menu]]
dofile(vrjLua.findInModelSearchPath([[Effects/HelpMenu.lua]]))

--[[ Set up models ]]
blackengineering = Model[[Black Engineering Model/Black.osg]]
metalmodel = Model[[mechdyne-models/modified.osg]]
tread = Model[[mechdyne-models/tread.osg]]
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


RelativeTo.World:addChild(
	Transform{
		position = {11.85, 1.85, 7.10},
		orientation = AngleAxis(Degrees(-120), Axis{0.0, 1.0, 0.0}),
		walkwayandxray
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
mylight = osg.Light()
mylight:setLightNum(0)
mylight:setAmbient(osg.Vec4(.52, .5, .52, 1))
mylight:setConstantAttenuation(.000001)
mylight:setPosition(osg.Vec4(1.5, 2, 2, 0))
mylightsource = osg.LightSource()
mylightsource:setLight(mylight)
mylightsource:setLocalStateSetModes(osg.StateAttribute.Values.ON)
local ss = RelativeTo.World:getOrCreateStateSet()
ss:setAssociatedModes(mylight, osg.StateAttribute.Values.ON)
RelativeTo.Room:addChild(mylightsource)

require("Actions")
require("TransparentGroup")

pointRadius = 0.0125

device = gadget.PositionInterface("VJWand")


--[[ Action for switching visibility of METaL ]]
Actions.addFrameAction(
	function()
		local switchBtn = gadget.DigitalInterface("WMButtonPlus")
		while true do
			components.Screens:setAllChildrenOn()
			components.Scrim:setAllChildrenOn()
			components.Projection:setAllChildrenOff()

			repeat
				Actions.waitForRedraw()
			until switchBtn.justPressed

			components.Scrim:setAllChildrenOff()
			components.Screens:setAllChildrenOff()
			components.Projection:setAllChildrenOn()

			repeat
				Actions.waitForRedraw()
			until switchBtn.justPressed

			components.Projection:setAllChildrenOff()

			repeat
				Actions.waitForRedraw()
			until switchBtn.justPressed

		end
	end
)


--[[ Action for switching navigation in METaL ]]
dofile(vrjLua.findInModelSearchPath([[Effects/rotateWand.lua]]))
dofile(vrjLua.findInModelSearchPath([[Effects/NavFly.lua]]))
--dofile(vrjLua.findInModelSearchPath([[Effects/NavigationToggle.lua]]))


-- This frame action draws and updates our
-- cursor at the device's location.
Actions.addFrameAction(
	function()
		local xform = osg.MatrixTransform()
		xform:addChild(
			TransparentGroup{
				alpha = 0.7,
				Sphere{
					radius = pointRadius,
					position = {0, 0, 0}
				}
			}
		)

		RelativeTo.Room:addChild(xform)

		-- Update the cursor position forever.
		while true do
			xform:setMatrix(device.matrix)
			Actions.waitForRedraw()
		end
	end
)

--[[This action allows user to draw and clear drawing]]
dofile(vrjLua.findInModelSearchPath([[Effects/Drawing.lua]]))
mydraw = DrawingTool{linewidth = (5)}
mydraw:startDrawing()


function startSound()
	--[[ Set up sound ]]
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