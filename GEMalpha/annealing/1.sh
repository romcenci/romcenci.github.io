#!/bin/bash

# particles
echo "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"15000\" height=\"9600\" viewBox=\"0 0 15000 9600\">" > 0.svg
for i in {0..399}; do
    echo "<rect x=\""$(( (i%25)*600 ))"\" y=\""$(( (i/25)*600 ))"\" width=\"600\" height=\"600\" style=\"fill:rgb(0,0,0)\"/>" >> 0.svg
    echo "<rect x=\""$(( (i%25)*600+60 ))"\" y=\""$(( (i/25)*600+60 ))"\" width=\"480\" height=\"480\" style=\"fill:rgba(0,0,0,0);stroke-width:2;stroke:#ffffff\"/>" >> 0.svg
    echo "<defs>\n\
            <clipPath id=\"svgPath"$i"\">\n\
	      <rect x=\""$(( (i%25)*600+60 ))"\" y=\""$(( (i/25)*600+60 ))"\" width=\"480\" height=\"480\" style=\"fill:rgba(0,0,0,0);stroke-width:2;stroke:#ffffff\"/>\n\
    	    </clipPath>\n\
      </defs>\n" >> 0.svg
    cat ../dados.dat | tail -n $(( $i*1250+500 )) | head -n 500 | awk -v size=600 -v L=$i -f 1.awk >> 0.svg;
done
echo "</svg>" >> 0.svg

#inkscape -w 15000 -h 9600 0.svg --export-filename 0.png

# clusters
#gcc ahc.c -lm -Ofast && ./a.out final.dat > clust.dat
#cat clust.dat | awk -f 2.awk > 2.svg
