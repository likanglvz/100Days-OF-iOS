#include<stdio.h>
int main(){
    int a[5]={1,2,3,4,5};
    int *p=a;
    *(p+1)=10;
    *(++p)=20;
    *(p++)=30;
    *p=40;
    int n=*p++;
    printf("n=%d,*p=%d\n",n,*p);
    return 0;
}