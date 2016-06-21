#include<stdio.h>
int getMax(int a,int b);
int getThreeMax(int a,int b,int c);
int main(){
    printf("max=%d\n",getThreeMax(20,10,46));
    return 0;
}
int getMax(int a,int b){
    return a>b?a:b;
}
int getThreeMax(int a,int b,int c){
    int middle;
    middle=getMax(a,b);
    return getMax(middle,c);
}