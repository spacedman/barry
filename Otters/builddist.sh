#!/bin/sh

# which image files do we need?

rm -f pics.tmp

files="Animals.html Camp.html Diary.html Introduction.html Otters.html People.html Scenery.html Travel.html Links.html"

for f in $files ; do
echo $f

grep "IMG SRC" $f | awk -F\" '{print $2}' | sort | uniq>> pics.tmp

done

tar zcvf Files.tar.gz $files `cat pics.tmp` Pictures/OtterBg.gif

rm pics.tmp

