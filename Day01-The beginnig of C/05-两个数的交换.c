/*交换整型变量a，b的值 a=20，b=45*/
//引入第三方变量
#include<stdio.h>
int main1(){
    int a=20;
    int b=45;
    int c;
    c=a;
    a=b;
    b=c;
    printf("交换后的值:\n");
    printf("a=%d\n",a);
    printf("b=%d\n",b);
    return 0;
}

//不引入第三方变量
int  main(){
    int a=20;
    int b=45;
    a=b-a;
    b=b-a;
    a=b+a;
    printf("交换后的值:\n");
    printf("a=%d\n",a);
    printf("b=%d\n",b);
    return 0;
}