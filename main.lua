--[[ Set up search path ]]
require("getScriptFilename")
fn = getScriptFilename()

print("This is " .. fn)

-- This line will error out if this script wasn't loaded from a file.
assert(fn, "Have to load this from file, not copy and paste, or we can't find our models!")

-- This will add the directory passed (or the parent directory of a file, such as fn)
-- to the model search path.
vrjLua.appendToModelSearchPath(fn)
vrjLua.appendToLuaRequirePath(fn)

--[[ Set up model ]]
metalmodel = Model("mechdyne-models/modified.osg")
RelativeTo.World:addChild(
	Transform{
		scale = .0005,
		metalmodel
	}
)

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




--[[ Set up sound ]]
--[[
snx.changeAPI("Audiere")

i = snx.SoundInfo()
i.filename = vrjLua.findInModelSearchPath("Aquascape - Sunrise.mp3")

i.ambient = true
s = snx.SoundHandle("bgaudio")
s:configure(i)
s:trigger(1)
]]
