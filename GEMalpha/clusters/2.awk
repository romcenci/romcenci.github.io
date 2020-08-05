#!/bin/awk

BEGIN{
    printf("<?xml-stylesheet type=\"text/css\" href=\"1.css\" ?>")
    printf("<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 800 800\">")
    printf("<defs>")
    printf("<clipPath id=\"svgPath\">")
    printf("<rect x=\"80\" y=\"80\" width=\"640\" height=\"640\" style=\"fill:rgba(0,0,0,0);stroke-width:2;stroke:#ffffff\"/>")
    printf("</clipPath>")
    printf("</defs>")
}

{
    for(i=-1; i<=1; i++){
	for(j=-1; j<=1; j++){
	    if(((0.9-0.1)*($1+i)+0.1) < 1.0 && ((0.9-0.1)*($1+i)+0.1) > 0.0){
		if(((0.9-0.1)*($2+j)+0.1) < 1.0 && ((0.9-0.1)*($2+j)+0.1) > 0.0){
		    if($3==2)
			printf("<circle class=\"circlest\" cx=\"%lf\" cy=\"%lf\" fill=\"#63ACBE\" r=\"20\"/>\n",	\
			       ((0.9-0.1)*($1+i)+0.1)*800, ((0.9-0.1)*($2+j)+0.1)*800)
		    if($3==3)
			printf("<circle class=\"circlest\" cx=\"%lf\" cy=\"%lf\" fill=\"#EE442F\" r=\"20\"/>\n",	\
			       ((0.9-0.1)*($1+i)+0.1)*800, ((0.9-0.1)*($2+j)+0.1)*800)
		    if($3==4)
			printf("<circle class=\"circlest\" cx=\"%lf\" cy=\"%lf\" fill=\"#702A5A\" r=\"20\"/>\n",	\
			       ((0.9-0.1)*($1+i)+0.1)*800, ((0.9-0.1)*($2+j)+0.1)*800)
	    
		    printf("<text class=\"text\" x=\"%lf\" y=\"%lf\" dominant-baseline=\"middle\" text-anchor=\"middle\" font-size=\"23\">%d</text>\n", \
			   ((0.9-0.1)*($1+i)+0.1)*800, ((0.9-0.1)*($2+j)+0.1)*800, $3)

		}
	    }
	}
    }
}

END{
    printf("</svg>")
}
