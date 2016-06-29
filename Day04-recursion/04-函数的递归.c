/*
   函数的递归：一个方法：自己调用自己，用上一次调用的结果作为这一次的参数
   递归的特点：
     1、有明确的结束的条件，递归的出口
     2、递归会为每一层的返回值开辟一个栈来存储，调用的次数越多会造成栈的overflow（溢出）
     3、递归的效率比较低，一般情况下慎用
 
1 1 2 3 5 8 13 21  ……
n-2  n-1  n
fibo(n-2)+fibo(n-1)=fibo(n)
 */
#include<stdio.h>
int fibo(int n);
int fibo1(int n);
int multi(int n);
int sum(int n);
int main(){
    int n;
    scanf("%d",&n);
    printf("第%d个fibo=%d\n",n,fibo(n));
    printf("第%d个fibo=%d\n",n,fibo1(n));
    printf("%d的阶乘是:%d\n",n,multi(n));
    printf("%d的累加和是:%d\n",n,sum(n));
    return 0;
}
int fibo(int n){
    //出口的条件
    if (n==1||n==2) {
        return 1;
    }
    //规律
    return fibo(n-1)+fibo(n-2);
}
int fibo1(int n){
    int a,b,c;
    a=0;
    b=1;
    c=0;
    if (n==1) {
        return 1;
    }
    for (int i=1; i<n; i++) {
        c=a+b;
        a=b;
        b=c;
    }     
    return c;
    
}

/*1*2*3*...*n=n!*/
int multi(int n){
    if (n==1) {
        return 1;
    }
    return n*multi(n-1);
}

/*1+2+....+n*/
int sum(int n){
    if (n==1) {
        return 1;
    }
    return n+sum(n-1);
}













