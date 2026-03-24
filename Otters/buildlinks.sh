#!/bin/sh

cat >Links.htm <<EOF
<table>
EOF

awk -F, '{printf "<tr><td align=right><b><a href=\"%s\">%s</a></b></td><td>%s</td></tr>\n",$3,$1,$2}' <Links.txt >>Links.htm

cat >>Links.htm <<EOF
</table>
EOF
