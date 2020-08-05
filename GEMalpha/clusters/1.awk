#!/bin/awk

BEGIN{
    printf("<?xml-stylesheet type=\"text/css\" href=\"1.css\" ?>")
    printf("<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 800\">")
    printf("<defs>")
    printf("<clipPath id=\"svgPath\">")
    printf("<rect x=\"80\" y=\"80\" width=\"640\" height=\"640\" style=\"fill:rgba(0,0,0,0);stroke-width:2;stroke:#ffffff\"/>")
    printf("</clipPath>")
    printf("</defs>")
    printf("<rect width=\"800\" height=\"800\" style=\"fill:rgb(0,0,0)\"/>\n")
    printf("<rect x=\"80\" y=\"80\" width=\"640\" height=\"640\" style=\"fill:rgba(0,0,0,0);stroke-width:2;stroke:#ffffff\"/>\n")
    
}

{
    for(i=-1; i<=1; i++)
	for(j=-1; j<=1; j++)
	    if(((0.9-0.1)*($1+i)+0.1) < 1.0 && ((0.9-0.1)*($1+i)+0.1) > 0.0)
		if(((0.9-0.1)*($2+j)+0.1) < 1.0 && ((0.9-0.1)*($2+j)+0.1) > 0.0)
		    printf("<circle class=\"circle\" fill=\"#ffffff\" cx=\"%lf\" cy=\"%lf\" r=\"5\"/>\n", \
			   ((0.9-0.1)*($1+i)+0.1)*800, ((0.9-0.1)*($2+j)+0.1)*800)
}

END{
    printf("</svg>")
}
