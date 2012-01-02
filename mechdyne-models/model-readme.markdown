About Model
===========

[Mechdyne][mechdyne] supplied us with an original SolidWorks 2011 document of the system. We are not permitted to make this publically available. However, per an email documented in `usage-restrictions.pdf`, we can use a triangulated model.

The model in this directory was created by loading the SolidWorks model in Deep Exploration, which made only a triangulated representation available. Ryan Pavlik decimated the model in DE, then split the mesh into useful sub-graphs and applied some simple textures and materials. The DE-edited model was then exported to an OSG-compatible format (I believe `.3ds`) and converted to a `.osg` file using `osgconv`.  The resulting file was manually edited to make groups into switches that could be changed at runtime.

[mechdyne]:http://www.mechdyne.com
