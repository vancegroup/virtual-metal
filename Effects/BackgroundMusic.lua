require "AddAppDirectory"
AddAppDirectory()

--[[ Set up sound ]]
function startSound()
	snx.changeAPI("Audiere")

	i = snx.SoundInfo()
	i.filename = vrjLua.findInModelSearchPath("aquascape_sunrise_recoded.mp3")

	i.ambient = true
	s = snx.SoundHandle("bgaudio")
	s:configure(i)

	-- Loop
	s:trigger(-1)
end

print("Run 'startSound()' to begin the audio")
