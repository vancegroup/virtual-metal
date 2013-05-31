require("Actions")

local function getNamedChild(node, name)
	for i = 0, node:getNumChildren() - 1 do
		local child = node:getChild(i)
		print(child:getName())
		if child:getName() == name then
			return child
		end
	end
end
components = { }

-- Populate the table of interesting nodes.
for i = 0, metalmodel:getNumChildren() - 1 do
	local child = metalmodel:getChild(i)
	components[child:getName()] = child
end


Actions.addFrameAction(
	function()
		local switchBtn = gadget.DigitalInterface("WMButtonDown")
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
