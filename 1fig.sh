#!/bin/bash
# GMT script for amazon CHM
# 07/07/2023 lin
#absolute path
path='/c/Users/lxiong/Desktop/Process'
R=-R-75/-42/-18/7

# gmt blockmean $path/data/is2_100m.csv $R -I1k >  $path/out/is2.xyz
# gmt xyz2grd $path/out/is2.xyz $R -I4k -Gis2.nc
# #gmt nearneighbor  $path/out/is2.xyz $R -I1k -E-9999 -Gis2.nc -S5k -N8+m8
# gmt makecpt -Chaxby -T0/40/1 -Z > ele.cpt
# gmt grdgradient is2.nc -Ne0.8 -A100 -fg -Ggradient.nc


gmt grdimage is2.nc -JM5i -Igradient.nc  $R -Cele.cpt -B5WSen -Q -K > is2.ps
gmt psscale -DJMR+w3.5i/0.2i+o0.5i/0i $R -J -Cele.cpt -I0.4 -Bxa5 -By+lm -O >> is2.ps
gmt psconvert is2.ps -A -Tt -E720 

start is2.tif
