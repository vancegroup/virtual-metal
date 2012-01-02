About Model
===========

[Mechdyne][mechdyne] supplied us with an original SolidWorks 2011 document of the system. We are not permitted to make this publically available. However, per an email documented in `usage-restrictions.pdf`, we can use a triangulated model.

The model in this directory was created by loading the SolidWorks model in Deep Exploration, which made only a triangulated representation available. Ryan Pavlik decimated the model in DE, then split the mesh into useful sub-graphs and applied some simple textures and materials. The DE-edited model was then exported to an OSG-compatible format (I believe `.3ds`) and converted to a `.osg` file using `osgconv`.  The resulting file was manually edited to make groups into switches that could be changed at runtime.

The three primary components that were separated out are:

- Scrim - the black fabric (canvas?) attached around the full structure, to reduce light leakage and to a degree prevent accidental damage. In the model, they block the view of the inside of the workings from anywhere except the projection space.

- Screens - The projection screens themselve, which block the view of the internals from the projection space.

- Projection Frusta - Representations of the image path for each wall after exiting the projector. Interesting to see sometimes.

[mechdyne]:http://www.mechdyne.com
