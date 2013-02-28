--[[ Action for switching navigation in METaL ]]
Actions.addFrameAction(
	function()
		local switchBtn = gadget.DigitalInterface("VWMButtonDown")
		while true do
			dofile(vrjLua.findInModelSearchPath([[Navigation/NavFly.lua]]))

			repeat
				Actions.waitForRedraw()
			until switchBtn.justPressed

			dofile(vrjLua.findInModelSearchPath([[Navigation/NavWalk.lua]]))

			repeat
				Actions.waitForRedraw()
			until switchBtn.justPressed

		end
	end
)