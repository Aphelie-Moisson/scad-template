include <lib/config.scad>

linear_extrude(3)
text(version_tag);

linear_extrude(2)
square(size);

linear_extrude(1)
circle(diameter);
