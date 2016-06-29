#include<stdio.h>
int main(){
    /*关系运算符的使用注意点:
     关系运算符中条件成立返回1，不成立返回0
    */
    
    int h=2>1;
    int g=1>3;
    printf("h=%d\n",h);
    printf("g=%d\n",g);
    //<,>,<=,>=的优先级比==，!=要高
    int t=2==3>1;
    printf("t=%d\n",t);
    //结合的方向是由左往右
    int j=4>3>2;
    printf("j=%d\n",j);
    //算术运算符优先级高于关系运算符
    int k=3+4>7-3;
    printf("k=%d\n",k);
    
    
    return 0;
}