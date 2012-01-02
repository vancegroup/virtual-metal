--[[ Set up search path ]]
require("getScriptFilename")
fn = getScriptFilename()

print("This is " .. fn)

-- This line will error out if this script wasn't loaded from a file.
assert(fn, "Have to load this from file, not copy and paste, or we can't find our models!")

-- This will add the directory passed (or the parent directory of a file, such as fn)
-- to the model search path.
vrjLua.appendToModelSearchPath(fn)

--[[ Set up model ]]
metalmodel = Model("mechdyne-models/modified.osg")
RelativeTo.World:addChild(
	Group{
		Transform{
			position = {4, 0, 0},
			scale = .0005,
			metalmodel
		},
		Transform{
			position = {0, 0, 0},
			Model("images.ive")
		}
	}
)

require("Text")

RelativeTo.World:addChild(TextGeode{
	"Training Session",
	position = {.5, 1.3, 0},
	lineHeight = .15,
	font = Font("DroidSansBold"),
})

function getNamedChild(node, name)
	for i=0,node:getNumChildren() - 1 do
		local child = node:getChild(i)
		print(child:getName())
		if child:getName() == name then
			return child
		end
	end
end

components = { }

for i=0,metalmodel:getNumChildren() - 1 do
	local child = metalmodel:getChild(i)
	components[child:getName()] = child
end

--[[ Set up lighting ]]
mylight = osg.Light()
mylight:setLightNum(0)
mylight:setAmbient(osg.Vec4(.5, .5, .5, 1))
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
Actions.addFrameAction(function()
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
end)

-- This frame action draws and updates our
-- cursor at the device's location.
Actions.addFrameAction(function()
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
end)

-- This action adds to the scenegraph when you
-- press/hold a button to draw
Actions.addFrameAction(function()
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

end)



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