require("getScriptFilename")
fn = getScriptFilename()
assert(fn, "Have to load this from file, not copy and paste, or we can't find our models!")
vrjLua.appendToModelSearchPath(fn)
vrjLua.appendToModelSearchPath(vrjLua.findInModelSearchPath("../../models/"))


ss = RelativeTo.World:getOrCreateStateSet()

l1=osg.Light()
l1:setLightNum(1)
ls1=osg.LightSource()
ls1:setLight(l1)
ls1:setLocalStateSetModes(osg.StateAttribute.Values.ON)
ss:setAssociatedModes(l1, osg.StateAttribute.Values.ON)
l1:setAmbient(osg.Vec4(.1,.1,.05,1))
l1:setDiffuse(osg.Vec4(.7,.7,.75,1))
l1:setSpecular(osg.Vec4(.1,.1,.05,1))
l1:setLinearAttenuation(.009)
RelativeTo.Room:addChild(ls1)
l1:setPosition(osg.Vec4(-5,3,-5,1))

RelativeTo.World:addChild(Sphere{radius=.23, position = {-5,3,-5}})

-- l2=osg.Light()
-- l2:setLightNum(2)
-- ls2=osg.LightSource()
-- ls2:setLight(l2)
-- ls2:setLocalStateSetModes(osg.StateAttribute.Values.ON)
-- ss:setAssociatedModes(l2, osg.StateAttribute.Values.OFF)
-- RelativeTo.Room:addChild(ls2)

-- l3=osg.Light()
-- l3:setLightNum(3)
-- ls3=osg.LightSource()
-- ls3:setLight(l3)
-- ls3:setLocalStateSetModes(osg.StateAttribute.Values.ON)
-- ss:setAssociatedModes(l3, osg.StateAttribute.Values.OFF)
-- RelativeTo.Room:addChild(ls3)

-- l4=osg.Light()
-- l4:setLightNum(4)
-- ls4=osg.LightSource()
-- ls4:setLight(l4)
-- ls4:setLocalStateSetModes(osg.StateAttribute.Values.ON)
-- ss:setAssociatedModes(l4, osg.StateAttribute.Values.OFF)
-- RelativeTo.Room:addChild(ls4)