Virtual METaL
=============

This is an application built with [VR JuggLua][vrjlua] that provides for virtual exploration of the [METaL virtual reality system][metal] at the [Iowa State University Virtual Reality Applications Center][vrac].

Instructions
------------
Load `main.lua` in NavTestbed to begin.

As a basic "NavTestbed" application, button 0 (A on the Wiimote) will navigate in the direction you point. Button 1 (B aka trigger on the Wiimote) will allow you to "draw" on the model with spheres.

Furthermore, button 2 (the Home button on the Wiimote) will cycle through three visibility modes for the model of METaL:

* Screens and scrim displayed, projection frustra not displayed
* Screens and scrim not displayed (structure exposed), projection frustra displayed
* Screens and scrim not displayed (structure exposed), projection frustra not displayed

See `model-readme.markdown` in the `mechdyne-models` folder for more information on what these components are.



[vrjlua]:https://github.com/vancegroup/vr-jugglua
[metal]:http://vrac.iastate.edu/METaL/
[vrac]:http://vrac.iastate.edu/
