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