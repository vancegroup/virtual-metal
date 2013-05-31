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

	print("Music: Aquascape - Sunrise, on Tunguska Chillout Grooves Vol. 7 from the Tunguska Electronic Music Society")
	print("Used under CC-BY-ND 3.0 - http://www.jamendo.com/en/track/761836/aquascape-sunrise")
end

print("Run 'startSound()' to begin the audio")
