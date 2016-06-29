
#include<stdio.h>
int main(){
 /*   //自动类型转换：高精度向低精度 （double--int）
    int a=10.8;
    printf("%d\n",a);
  
  */
 /*
    //强制类型转换
    int a=(int)10.8;
    printf("%d\n",a);
  */
    
    //自动类型的提升（int——》double）
    double c=10.8;
    int a=6;
    double e=c+a;
    printf("e=%lf\n",e);
    double g=(double)3/2;
    int g1=3/2;
    printf("g=%lf\n",g);
    printf("g1=%d\n",g1);
    return 0;
}