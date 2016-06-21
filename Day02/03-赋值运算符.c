#include<stdio.h>
int main(){
    
    int a=4,b=4,c=1;
    c*=a;//c=c-a;
    printf("c=%d\n",c);
   int d=a>>1;
   //三目运算符（条件A?m:n)如果条件A成立返回m，否则返回n
    int e=(a>2)?5:16;
    printf("e=%d\n",e);
    
    
    return 0;
}