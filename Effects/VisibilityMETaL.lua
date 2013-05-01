require("Actions")

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