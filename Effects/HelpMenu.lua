require "Actions"
require "gldef"

wiihelp = Transform{
	position={0,1.3,0},
	orientation=AngleAxis(Degrees(90), Axis{1.0,0.0,0.0}),
	scale=.5,
	Model([[component-models/HelpMenu/HelpMenu.ive]]),
}

ss = wiihelp:getOrCreateStateSet()

ss:setMode(gldef.GL_LIGHTING, osg.StateAttribute.Values.OFF)

Actions.addFrameAction(
	function()
		local wand = gadget.PositionInterface('VJWand')
		local device = gadget.DigitalInterface("WMButton2")
		while true do
			repeat
				Actions.waitForRedraw()
			until device.justPressed
			RelativeTo.Room:addChild(wiihelp)
			repeat
				Actions.waitForRedraw()
			until device.justPressed
			RelativeTo.Room:removeChild(wiihelp)
		end
	end
)
