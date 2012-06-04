--[[ Set up search path ]]
require("getScriptFilename")
fn = getScriptFilename()

print("This is " .. fn)

-- This line will error out if this script wasn't loaded from a file.
assert(fn, "Have to load this from file, not copy and paste, or we can't find our models!")

-- This will add the directory passed (or the parent directory of a file, such as fn)
-- to the model search path.
vrjLua.appendToModelSearchPath(fn)

dofile(vrjLua.findInModelSearchPath([[simpleLightseditjp.lua]]))

--[[ Set up model ]]
room = Model[[Black Engineering Model/Black.osg]]

RelativeTo.World:addChild(
	Transform{
		position = {41.7, 0, 25.5},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		room
	}
)

metalmodel = Model("mechdyne-models/modified.osg")

RelativeTo.World:addChild(
	Group{
		Transform{
			position = {5, .055, -2.8},
			orientation = AngleAxis(Degrees(30), Axis{0.0, 1.0, 0.0}),
			scale = .0009,
			metalmodel
		},
		Transform{
			position = {-100, 0, -3},
			orientation = AngleAxis(Degrees(0), Axis{0.0, 1.0, 0.0}),
			Model("other-models/images.ive")
		}
	}
)

serverrack = Model("sketchup-matched-photo-models/rack model.osg")

RelativeTo.World:addChild(
	Transform{
		position = {3, 1.22, -3.9},
		orientation = AngleAxis(Degrees(35), Axis{0.0, 1.0, 0.0}),
		serverrack
	}
)

walkwayandxray = Model("component-models/Walkway/walkwayandxray.lwo.osg")

RelativeTo.World:addChild(
	Transform{
		position = {17.35, 1.85, -1.35},
		orientation = AngleAxis(Degrees(-90), Axis{0.0, 1.0, 0.0}),
		walkwayandxray
	}
)

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
	position = {2.75, .715, -2.9},
	orientation = AngleAxis(Degrees(-60), Axis{0.0, 1.0, 0.0}),
	workspace
	}

RelativeTo.World:addChild(groupedworkspace)

fluorescent1 = Model[[component-models/Lights/Fluorescent1.osg]]
fluorescent2 = Model[[component-models/Lights/Fluorescent2.osg]]
fluorescent3 = Model[[component-models/Lights/Fluorescent3.osg]]

fluorescentlights = Group{

	Transform{
		position = {2.5, 4.5, 9.2},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		fluorescent1
	},

	Transform{
		position = {5.9, 4.5, 3.9},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		fluorescent2
	},

	Transform{
		position = {9.2, 4.5, 3.9},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		fluorescent2
	},

	Transform{
		position = {12.5, 4.5, 3.9},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		fluorescent2
	},

	Transform{
		position = {16, 5.5, 1.5},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		fluorescent3
	},

	Transform{
		position = {18, 5.5, 1.5},
		orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
		fluorescent3
	},
}

RelativeTo.World:addChild(fluorescentlights)

-- Desk by the right wall
RelativeTo.World:addChild(
	Transform{
		position = {7.5, .715, 1},
		orientation = AngleAxis(Degrees(0), Axis{0.0, 0.0, 0.0}),
		desk
	}
)

cubicles = Model[[component-models/cubicles/cubicles.osg]]

RelativeTo.World:addChild(
	Transform{
		position = {4, 0, 3.9},
		orientation = AngleAxis(Degrees(-90), Axis{0.0, 1.0, 0.0}),
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

--[[ Action for switching visibility ]]
Actions.addFrameAction(
	function()
		local switchBtn = gadget.DigitalInterface("VJButton2")
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

-- This action adds to the scenegraph when you
-- press/hold a button to draw
Actions.addFrameAction(
	function()
		local drawBtn = gadget.DigitalInterface("VJButton1")
		while true do
			while not drawBtn.pressed do
				Actions.waitForRedraw()
			end

			while drawBtn.pressed do
				local newPoint = osg.PositionAttitudeTransform()
				newPoint:addChild(Sphere{radius = pointRadius, position = {0, 0, 0}})
				newPoint:setPosition(device.position - osgnav.position)

				RelativeTo.World:addChild(newPoint)

				Actions.waitForRedraw()
			end
		end

	end
)



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