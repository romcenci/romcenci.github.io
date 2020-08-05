#!/bin/bash

# particles
echo "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"800\" height=\"40000\" viewBox=\"0 0 800 40000\">" > 0.svg
for i in {0..49}; do
    echo "<rect x=\"0\" y=\""$(( i*800 ))"\" width=\"800\" height=\"800\" style=\"fill:rgb(0,0,0)\"/>" >> 0.svg
    echo "<rect x=\"80\" y=\""$(( 80+i*800 ))"\" width=\"640\" height=\"640\" style=\"fill:rgba(0,0,0,0);stroke-width:2;stroke:#ffffff\"/>" >> 0.svg
    echo "<defs>\n\
            <clipPath id=\"svgPath"$i"\">\n\
	      <rect x=\"80\" y=\""$(( 80+i*800 ))"\" width=\"640\" height=\"640\" style=\"fill:rgba(0,0,0,0);stroke-width:2;stroke:#ffffff\"/>\n\
    	    </clipPath>\n\
      </defs>\n" >> 0.svg
    cat ../dados.dat | tail -n $(( $i*2000+500 )) | head -n 500 | awk -v size=800 -v L=$i -f 1.awk >> 0.svg;
done
echo "</svg>" >> 0.svg

# clusters
#gcc ahc.c -lm -Ofast && ./a.out final.dat > clust.dat
#cat clust.dat | awk -f 2.awk > 2.svg
