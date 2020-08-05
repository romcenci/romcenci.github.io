#!/bin/awk

#BEGIN{
#    printf("<svg>\n");
#}

{
    for(i=-1; i<=1; i++)
	for(j=-1; j<=1; j++)
	    if(((0.9-0.1)*($1+i)+0.1) < 1.0 && ((0.9-0.1)*($1+i)+0.1) > 0.0)
		if(((0.9-0.1)*($2+j)+0.1) < 1.0 && ((0.9-0.1)*($2+j)+0.1) > 0.0)
		    printf("<circle class=\"circle\" fill=\"#ffffff\" cx=\"%lf\" cy=\"%lf\" r=\"3.75\" clip-path=\"url(#svgPath%d)\" />\n", ((0.9-0.1)*($1+i)+0.1+int(L%25))*size, ((0.9-0.1)*($2+j)+0.1+int(L/25))*size, L)
}

#END{
#    printf("</svg>")
#}
