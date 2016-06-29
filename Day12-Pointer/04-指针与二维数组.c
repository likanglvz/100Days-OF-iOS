#include<stdio.h>
int main(){
    int  arr[2][3]={1,2,3,4,5,6};
    printf("arr:%p\n",arr);
    for (int i=0; i<2; i++) {
        printf("arr[%d]=%p\n",i,arr[i]);
        printf("arr+%d=%p\n",i,arr+i);
        printf("*(arr+%d)=%p\n",i,*(arr+i));
    }
   
    for (int i=0; i<2; i++) {
        for (int j=0; j<3; j++) {
            printf("arr[%d][%d]=%d\n",i,j,arr[i][j]);
            printf("arr[%d][%d]=%d\n",i,j,*(*(arr+i)+j));
        }
    }
    
    return 0;
}