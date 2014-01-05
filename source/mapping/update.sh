#!/bin/sh

DEST=../content/media/maps/

for map in research teaching ; do
    rm -f tmp.geojson
    ogr2ogr -f GeoJSON tmp.geojson ${map}.shp
    echo "var $map=[" >$DEST/${map}.geojson
    cat tmp.geojson >>$DEST/${map}.geojson
    echo "];" >>$DEST/${map}.geojson
    
done
rm -f tmp.geojson
#ogr2ogr -f GeoJSON $DEST/teaching.geojson teaching.shp
