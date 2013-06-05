require "gldef"

Bubbles1 = Transform{
	position = {7.75, 1, 11.675},
	orientation = AngleAxis(Degrees(-90), Axis{1.0, 0.0, 0.0}),
	scale = .1,
	Model([[component-models/Bubbles/Bubbles.osg]]),
}
RelativeTo.World:addChild(Bubbles1)

Bubbles1_ss = Bubbles1:getOrCreateStateSet()

-- This line makes it so that it draws over everything (except apparently transparent stuff like the frusta)
Bubbles1_ss:setMode(gldef.GL_DEPTH_TEST, osg.StateAttribute.Values.OFF)

-- This line makes it draw after the transparent things.
Bubbles1_ss:setRenderingHint(osg.StateSet.RenderingHint.TRANSPARENT_BIN)


Bubbles2 = Transform{
	position = {12.775, .05, 3.5},
	orientation = AngleAxis(Degrees(-90), Axis{1.0, 0.0, 0.0}),
	scale = .1,
	Model([[component-models/Bubbles/Bubbles.osg]]),
}
RelativeTo.World:addChild(Bubbles2)

Bubbles2_ss = Bubbles2:getOrCreateStateSet()
Bubbles2_ss:setMode(gldef.GL_DEPTH_TEST, osg.StateAttribute.Values.OFF)
Bubbles2_ss:setRenderingHint(osg.StateSet.RenderingHint.TRANSPARENT_BIN)