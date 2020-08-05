/***********************************************************************/
/* ### Agglomerative Hierarchical Clustering ###		       */
/* 								       */
/* Lê os dados de um arquivo e classifica-os em			       */
/* clusters de acordo com uma árvore (dendograma)		       */
/* de distâncias						       */
/* 								       */
/* # Contribuidores:						       */
/* - Rômulo Cenci						       */
/* 								       */
/***********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <ahc.h>

#define rho 1.40
#define N 500
#define L sqrt(1.0*N/rho)
#define LindemannRatio 0.891732
#define dcut LindemannRatio/L

int main(int argc, char *argv[]){
  int i=0,j,k,Ncl;
  double xc, yc, ct, st, cp, sp;
  point p;
  FILE *f1;

  // Pega os dados de um arquivo
  f1 = fopen(argv[1],"r");
  double x[N], y[N];
  for(i=0; i<N; i++){
    fscanf(f1,"%lf %lf", &x[i], &y[i]);
  }
  fclose(f1);

  // Clusterize
  cluster cluster[N];
  Ncl = clusterize(x,y,cluster,N,dcut);
  
  // Find centroids
  point centroids[Ncl];
  find_centroids(cluster,centroids,Ncl);

  for(i=0; i<Ncl; i++){
    printf("%lf %lf %d\n", centroids[i].x, centroids[i].y, cluster[i].size);
  }
}
