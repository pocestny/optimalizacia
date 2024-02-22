#include <stdio.h>
#include <stdlib.h>

int X,Y;

int main(int argc, char **argv) {
   int i,j;
   char c;

  sscanf(argv[1],"%d",&X);
  sscanf(argv[2],"%d",&Y);

  for (i=0;i<Y;i++) {
    for (j=0;j<X;j++) printf("%d ",getchar());
    printf("\n");
  }
  return 0;
}




